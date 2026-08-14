// Instantiate spa-wasm-eh-raw.wasm and call spa_eh_probe.
// Expects 1 if D catch ran. Needs Node with WebAssembly.Exception + Tag.
import { readFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const dir = dirname(fileURLToPath(import.meta.url));
const buf = readFileSync(join(dir, 'public', 'spa-wasm-eh-raw.wasm'));

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
const fn = instance.exports.spa_eh_probe;
if (typeof fn !== 'function') {
  console.error('FAIL: spa_eh_probe not exported');
  process.exit(1);
}
try {
  const r = fn();
  if (r === 1) {
    console.log('PASS: spa_eh_probe returned 1 (D catch ran)');
    process.exit(0);
  }
  console.error('FAIL: spa_eh_probe returned', r);
  process.exit(1);
} catch (e) {
  console.error('FAIL: wasm threw into JS', e);
  process.exit(1);
}
