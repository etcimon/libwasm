const abort = (what,file,line, msg) => {
    console.error(`ABORT: ${what} @ ${file}:${line} ${msg}`)
    throw `ABORT: ${what} @ ${file}:${line} ${msg}`;
}

const sliceError = (what, file, line, lower, upper, length) => {
    let msg = ` slice[${lower} .. ${upper}] invalid on len ${length}`
    abort(what, file, line, msg);
}
const indexError = (what, file, line, idx, length) => {
    let msg = ` indx[${idx}] invalid on len ${length}`
    abort(what, file, line, msg);
}

const utf8Decoder = new TextDecoder('utf-8');
const utf8Encoder = new TextEncoder();

let objects = {1: document, 2: window};
let freelist = [];
let addObject = (value) => {
        if (value === null || value == undefined) return 0;
        let idx = 0;
        if (value instanceof Promise)
        {
            idx = ++libwasm.lastPromisePtr;
        }
        else idx = freelist.pop() || ++libwasm.lastPtr;
        objects[idx] = value;
        return idx;
    },
    getObject = (ptr) => objects[ptr],
    removeObject = (ptr) => {
        if (objects[ptr] === undefined) return;
        if (!(objects[ptr] instanceof Promise))
            freelist.push(ptr)
        delete objects[ptr]
    };
let MemoryIdentifiers = {
    'i64u': 0,
    'i64s': 1,
    'i32s': 2,
    'i32u': 3,
    'i16s': 4,
    'i16u': 5,
    'i8s': 6,
    'i8u': 7,
    'f32': 8,
    'f64': 9
  };
const setupMemory = (memory) => {
    libwasm.memory = memory;
    libwasm.buffer = memory.buffer;
}
const libwasm = {
    nativeFunctions: {},
    lastPtr: 2,
    lastPromisePtr: 65536,
    instance: null,
    init: (modules) => {
        window.libwasm = libwasm
        if (!libwasm.exports) {
            var tmp = {};
            modules.map(m=>m.jsExports).filter(a=>!!a).map(e=>Object.entries(e).forEach(e=>tmp[e[0]] = Object.assign.apply(null,[tmp[e[0]] || {}, e[1]])));
            libwasm.exports = tmp;

            // for lodash
            window.sifg = (ptr)=>libwasm.instance.exports.__indirect_function_table.get(ptr),
            window.ao = libwasm.addObject;
            window.es = encoders.string;
            window.nodes = libwasm.objects;
            window.callNative = (fct_name, val) => {
                let fct = libwasm.nativeFunctionMap[fct_name];
                if (fct && fct.fun) {
                    let handle = addObject(val);
                    libwasm.instance.exports.jsCallback(ctx, fun, handle);
                }
                else
                    console.error(`Function ${fct_name} is not registered.`)
            };
        }
        if ('undefined' === typeof WebAssembly.instantiateStreaming) {
            fetch('dom')
                .then(request => request.arrayBuffer())
                .then(bytes => WebAssembly.compile(bytes))
                .then(module => {
                    let instance = new WebAssembly.Instance(module, libwasm.exports);
                    libwasm.instance = instance;
                    setupMemory(instance.exports.memory);
                    instance.exports._start(instance.exports.__heap_base);
                    heap_base_value = instance.exports.__heap_base.value;
                });
        } else {
            WebAssembly.instantiateStreaming(fetch('dom'), libwasm.exports)
                .then(obj => {
                    let instance = obj.instance;
                    libwasm.instance = instance;
                    setupMemory(instance.exports.memory);
                    instance.exports._start(instance.exports.__heap_base);
                    heap_base_value = instance.exports.__heap_base.value;
                });
        }
    },
    objects,
    addObject: addObject,
    removeObject: removeObject,
    freelists: freelist,
    MemoryIdentifiers: MemoryIdentifiers
}

let encoders = {
    string: (ptr, val, heapi32u = null, is_ret_arr = false) => {
        if (typeof(val) !== "string") {
            if (val !== undefined) val = val.toString();
            else val = "undefined";
        }
        const encodedString = utf8Encoder.encode(val);
        const wasmPtr = libwasm.instance.exports.allocString(encodedString.length);
        const asBytes = new Uint8Array(libwasm.memory.buffer, wasmPtr, encodedString.length);
        asBytes.set(encodedString);
        if (is_ret_arr) 
            return [encodedString.length, wasmPtr]
        if (!heapi32u) heapi32u = new Uint32Array(libwasm.memory.buffer)
        heapi32u[ptr / 4] = encodedString.length;
        heapi32u[(ptr / 4)+1] = wasmPtr;
        return ptr;
        
    }
}
let wasm_constants_decoded = new Map();
let heap_base_value;
let decoders = {
    string: (len, offset, heapi32u = null) => {
        
        if (offset == null) {
            if (!heapi32u) heapi32u = new Uint32Array(libwasm.memory.buffer)
            offset = heapi32u[(len+4)/4];
            len = heapi32u[(len/4)];
        }
        let str;
        if (offset < heap_base_value && (str = wasm_constants_decoded[offset]))
            return str;
        
        str = utf8Decoder.decode(new DataView(libwasm.memory.buffer,offset,len));
        //console.log(offset + ' ' + str)
        
        if (offset < heap_base_value) {
            wasm_constants_decoded[offset] = str;
        }
        return str;

    }
}
let jsExports = {
    env: {
        onOutOfMemoryError: () => abort("Out of memory exception"),
        _d_assert: (file,line) => abort("assert",file,line),
        _d_assert_msg: (file,line,msg) => abort("assert",file,line,msg),
        _d_arraybounds_slice: (file, line, lower, upper, length) => sliceError("_d_arraybounds_slice", file, line, lower, upper, length),
        _d_arraybounds_index: (file, line, idx, length) => indexError("_d_arraybounds_index", file, line, idx, length),
        _D4core8internal5array11arrayassign27enforceRawArraysConformableFNaNbNiNexAaxkxAvxQdxbZv: ()=>{},
        _D6object10_xopEqualsFIPvIQdZb: (ptr1,ptr2) => abort("opEquals not implemented"),
        _D6object7_xopCmpFIPvIQdZb: (ptr1,ptr2) => abort("opCmp not implemented"),
        doLog: arg => console.log(arg),
        memory: libwasm.memory,
        __assert: () => {},
        _Unwind_Resume: () => {
            console.log(arguments);
        },
        _d_dynamic_cast: () => {
            console.log(arguments)
        },
        libwasm_add__bool: (b)=>addObject(!!b),
        libwasm_add__int: addObject,
        libwasm_add__uint: addObject,
        libwasm_add__long: addObject,
        libwasm_add__ulong: addObject,
        libwasm_add__short: addObject,
        libwasm_add__ushort: addObject,
        libwasm_add__byte: addObject,
        libwasm_add__ubyte: addObject,
        libwasm_add__float: addObject,
        libwasm_add__double: addObject,
        libwasm_add__object: () => addObject({}),
        libwasm_add__string: (len, offset) => {
            let str = decoders.string(len, offset);
            return addObject(str);
        },
        libwasm_set__function: (len, offset, ctx, fun) => {
            let fct_name = decoders.string(len, offset);
            libwasm.nativeFunctionMap[fct_name] = {ctx, fun};
        },
        libwasm_get__field: (handle, len, offset) => {
            return addObject(getObject(handle)[decoders.string(len,offset)]);
        },
        libwasm_get_idx__field: (handle, idx) => {
            return addObject(getObject(handle)[idx]);
        },
        libwasm_get__int: getObject,
        libwasm_get__uint: getObject,
        libwasm_get__long: (ptr)=>BigInt(getObject(ptr)),
        libwasm_get__ulong: (ptr)=>BigInt(getObject(ptr)),
        libwasm_get__short: getObject,
        libwasm_get__ushort: getObject,
        libwasm_get__float: getObject,
        libwasm_get__double: getObject,
        libwasm_get__byte: getObject,
        libwasm_get__ubyte: getObject,
        libwasm_get__string: (rawResult, ptr) => {
            encoders.string(rawResult, getObject(ptr));
        },
        libwasm_removeObject: (ctx) => {
            if (objects[ctx] === undefined) return;       
            if (!(objects[ctx] instanceof Promise))
                freelist.push(ctx)
            delete objects[ctx]
        },
        DataView_Create: (len, offset) => {
            return addObject(new DataView(libwasm.memory.buffer, offset, len));
        },
        Float32Array_Create: (len, offset) => {
            return addObject(new Float32Array(libwasm.memory.buffer, offset, len));
        },
        Uint8Array_Create: (len, offset) => {
            return addObject(new Uint8Array(libwasm.memory.buffer, offset, len));
        }
    }
};

export {libwasm, encoders, decoders, jsExports};
