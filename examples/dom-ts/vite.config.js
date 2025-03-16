import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/postcss'
import autoprefixer from 'autoprefixer'
import fs from 'fs/promises'
import { WebSocketServer } from 'ws'
import { exec } from 'node:child_process'

const isProduction = process.env.NODE_ENV === 'production'
const port = process.env.PORT || 5173
const base = process.env.BASE || '/'

export default defineConfig({
    base,
    server: {
        port,
        // Remove middlewareMode to enable Vite's built-in HTTP server
        watch: {
            // Watch for changes in the WASM file
            ignored: ['!public/*.wasm', 'public/*-raw.wasm'],
        },
        hmr: false,
        headers: {
            'Cache-Control': 'no-store',
        },
    },
    build: {
        rollupOptions: {
            input: './index.html',
        },
    },
    css: {
        postcss: {
            plugins: [tailwindcss(), autoprefixer()],
        },
    },
    plugins: [
        {
            name: 'watch-wasm',
            configureServer(server) {
                const wss = new WebSocketServer({ port: 3001 })
                let building = false

                function notifyClients() {
                    const notifyFct = () => {
                        if (building) setTimeout(notifyFct, 200)
                        else
                            wss.clients.forEach((client) => {
                                console.log('..Posting hot reload... ')
                                if (client.readyState === 1) {
                                    // WebSocket.OPEN === 1
                                    client.send('reload')
                                }
                            })
                    }
                    if (building) setTimeout(notifyFct, 200)
                }
                function reloadClients() {
                    wss.clients.forEach((client) => {
                        if (client.readyState === 1) {
                            // WebSocket.OPEN === 1
                            client.send('full-reload')
                        }
                    })
                }

                let lastModified = 0
                server.watcher.add('public/*.wasm')
                server.watcher.add('src-d/*.d')
                server.watcher.add('src-d-views/*')
                server.watcher.on('change', async (file) => {
                    if (file.endsWith('-raw.wasm')) return

                    if (file.endsWith('.wasm')) {
                        const stat = await fs.stat(file)
                        if (stat.size === 0) return
                        if (stat.mtimeMs !== lastModified) {
                            lastModified = stat.mtimeMs
                            notifyClients()
                        }
                    } else if (
                        file.endsWith('.d') ||
                        file.includes('src-d-views')
                    ) {
                        if (building) {
                            process.stdout.write('busy')
                            return
                        }
                        console.log('File changed: ', file)
                        process.stdout.write('Building...')
                        building = true
                        let startTime = performance.now()
                        try {
                            function showDot() {
                                setTimeout(() => {
                                    if (building) {
                                        process.stdout.write('.')
                                        showDot()
                                    }
                                }, 1000)
                            }

                            showDot()
                            await exec(
                                'dub build --arch=wasm32-unknown-wasi --compiler=ldc2',
                                (error, stdout, stderr) => {
                                    if (error) {
                                        console.error(`exec error: ${error}`)
                                        building = false
                                        return
                                    }
                                    //if (stdout) console.log(`stdout: ${stdout}`)
                                    if (stderr)
                                        console.error(`stderr: ${stderr}`)

                                    console.log(
                                        'Built in ',
                                        (performance.now() - startTime) / 1000,
                                        's'
                                    )
                                    building = false
                                }
                            )
                        } catch (e) {
                            console.error(e)
                            building = false
                        }
                    } else if (file.includes('src-ts')) {
                        console.log('File changed: ', file)
                        reloadClients()
                    } else {
                        console.log('Uncaptured file change: ', file)
                    }
                })
            },
        },
    ],
})
