// Instantiate spa-phobos-raw.wasm and call spa_phobos_probe.
// Expects 1 if every Phobos slice + D catch ran.
import { readFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const dir = dirname(fileURLToPath(import.meta.url));
const buf = readFileSync(join(dir, 'public', 'spa-phobos-raw.wasm'));

const tag = new WebAssembly.Tag({ parameters: ['i32'] });
const nop = () => 0;
const env = new Proxy(
  { __cpp_exception: tag },
  {
    get(t, k) {
      if (k in t) return t[k];
      return nop;
    },
    has() {
      return true;
    },
  }
);

const { instance } = await WebAssembly.instantiate(buf, { env });
if (instance.exports.memory && instance.exports.memory.grow) {
  try {
    instance.exports.memory.grow(64);
  } catch {
    /* already large enough */
  }
}
const fn = instance.exports.spa_phobos_probe;
if (typeof fn !== 'function') {
  console.error('FAIL: spa_phobos_probe not exported');
  process.exit(1);
}
try {
  const r = fn();
  if (r === 1) {
    console.log('PASS: spa_phobos_probe returned 1 (Phobos + D catch)');
    process.exit(0);
  }
  console.error('FAIL: spa_phobos_probe returned', r, '(bitmask of slices; -1 init, -2 uncaught)');
  process.exit(1);
} catch (e) {
  console.error('FAIL: wasm threw into JS', e);
  process.exit(1);
}
