import { readFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const dir = dirname(fileURLToPath(import.meta.url));
const buf = readFileSync(join(dir, 'public', 'spa-phobos-raw.wasm'));
const mod = new WebAssembly.Module(buf);
for (const im of WebAssembly.Module.imports(mod)) {
  const t = im.type;
  if (t === 'function') {
    console.log(`${im.module}.${im.name}  func`);
  } else {
    console.log(`${im.module}.${im.name}  ${JSON.stringify(t)}`);
  }
}
console.log('--- exports ---');
for (const ex of WebAssembly.Module.exports(mod)) {
  console.log(`${ex.name}  ${ex.kind}`);
}
