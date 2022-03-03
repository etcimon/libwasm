const abort = (what,file,line) => {
    throw `ABORT: $what @ $file:$line`;
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
            idx = ++spasm.lastPromisePtr;
        }
        else idx = freelist.pop() || ++spasm.lastPtr;
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
    spasm.memory = memory;
    spasm.buffer = memory.buffer;
}
const spasm = {
    lastPtr: 2,
    lastPromisePtr: 65536,
    instance: null,
    init: (modules) => {
        window.spasm = spasm
        if (!spasm.exports) {
            var tmp = {};
            modules.map(m=>m.jsExports).filter(a=>!!a).map(e=>Object.entries(e).forEach(e=>tmp[e[0]] = Object.assign.apply(null,[tmp[e[0]] || {}, e[1]])));
            spasm.exports = tmp;
        }
        if ('undefined' === typeof WebAssembly.instantiateStreaming) {
            fetch('dom')
                .then(request => request.arrayBuffer())
                .then(bytes => WebAssembly.compile(bytes))
                .then(module => {
                    let instance = new WebAssembly.Instance(module, spasm.exports);
                    spasm.instance = instance
                    setupMemory(instance.exports.memory);
                    instance.exports._start(instance.exports.__heap_base);
                });
        } else {
            WebAssembly.instantiateStreaming(fetch('dom'), spasm.exports)
                .then(obj => {
                    let instance = obj.instance;
                    spasm.instance = instance;
                    setupMemory(instance.exports.memory);
                    instance.exports._start(instance.exports.__heap_base);
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
        if (typeof(val) !== "string") val = val.toString();
        const encodedString = utf8Encoder.encode(val);
        const wasmPtr = spasm.instance.exports.allocString(encodedString.length);
        const asBytes = new Uint8Array(spasm.memory.buffer, wasmPtr, encodedString.length);
        asBytes.set(encodedString);
        if (is_ret_arr) 
            return [encodedString.length, wasmPtr]
        if (!heapi32u) heapi32u = new Uint32Array(spasm.memory.buffer)
        heapi32u[ptr / 4] = encodedString.length;
        heapi32u[(ptr / 4)+1] = wasmPtr;
        return ptr;
        
    }
}
let decoders = {
    string: (len, offset, heapi32u = null) => {
        if (offset == null) {
            if (!heapi32u) heapi32u = new Uint32Array(spasm.memory.buffer)
            offset = heapi32u[(len+4)/4];
            len = heapi32u[(len/4)];
        }
        return utf8Decoder.decode(new DataView(spasm.memory.buffer,offset,len));
    }
}
let jsExports = {
    env: {
        onOutOfMemoryError: () => abort("Out of memory exception"),
        _d_assert: (file,line) => abort("assert",file,line),
        doLog: arg => console.log(arg),
        memory: spasm.memory,
        __assert: () => {},
        _Unwind_Resume: () => {
            console.log(arguments);
        },
        _d_dynamic_cast: () => {
            console.log(arguments)
        },
        spasm_add__bool: (b)=>addObject(!!b),
        spasm_add__int: addObject,
        spasm_add__uint: addObject,
        spasm_add__long: addObject,
        spasm_add__ulong: addObject,
        spasm_add__short: addObject,
        spasm_add__ushort: addObject,
        spasm_add__byte: addObject,
        spasm_add__ubyte: addObject,
        spasm_add__float: addObject,
        spasm_add__double: addObject,
        spasm_add__object: () => addObject({}),
        spasm_add__string: (len, offset) => {
            let str = decoders.string(len, offset);
            return addObject(str);
        },
        spasm_get__field: (handle, len, offset) => {
            return addObject(getObject(handle)[decoders.string(len,offset)]);
        },
        spasm_get_idx__field: (handle, idx) => {
            return addObject(getObject(handle)[idx]);
        },
        spasm_get__int: getObject,
        spasm_get__uint: getObject,
        spasm_get__long: getObject,
        spasm_get__ulong: getObject,
        spasm_get__short: getObject,
        spasm_get__ushort: getObject,
        spasm_get__float: getObject,
        spasm_get__double: getObject,
        spasm_get__byte: getObject,
        spasm_get__ubyte: getObject,
        spasm_get__string: (rawResult, ptr) => {
            encoders.string(rawResult, getObject(ptr));
        },
        spasm_removeObject: (ctx) => {
            if (objects[ctx] === undefined) return;       
            if (!(objects[ctx] instanceof Promise))
                freelist.push(ctx)
            delete objects[ctx]
        },
        DataView_Create: (len, offset) => {
            return addObject(new DataView(spasm.memory.buffer, offset, len));
        },
        Float32Array_Create: (len, offset) => {
            return addObject(new Float32Array(spasm.memory.buffer, offset, len));
        },
        Uint8Array_Create: (len, offset) => {
            return addObject(new Uint8Array(spasm.memory.buffer, offset, len));
        }
    }
};

export {spasm, encoders, decoders, jsExports};
