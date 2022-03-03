import {spasm as spa, encoders as encoder, decoders as decoder} from '../modules/spasm.js';
import {_} from 'lodash';
let spasm = spa;
let memory = {};
let ops = {};

const setupMemory = (cond) => {  
    for(let idx in cond) {
      switch (cond[idx]) {
        case 0:
          if (!memory.heapi64u) {            
            memory.heapi64u = new BigUint64Array(spasm.memory.buffer)
            ops.setULong = (ptr, val) => (memory.heapi64u[ptr/8] = BigInt(val)),
            ops.getULong = (ptr) => memory.heapi64u[ptr/8]
          }
          break;
        case 1:
          if (!memory.heapi64s) {
            memory.heapi64s = new BigInt64Array(spasm.memory.buffer)                  
            ops.setLong = (ptr, val) => (memory.heapi64s[ptr/8] = BigInt(val)),
            ops.getLong = (ptr) => memory.heapi64s[ptr/8]
          }
          break;
        case 2:          
          if (!memory.heapi32s) {
            memory.heapi32s = new Int32Array(spasm.memory.buffer)                  
            ops.setInt = (ptr, val) => (memory.heapi32s[ptr/4] = val),
            ops.getInt = (ptr) => memory.heapi32s[ptr/4]
          }
          break;
        case 3:          
          if (!memory.heapi32u) {
            memory.heapi32u = new Uint32Array(spasm.memory.buffer)
            ops.setBool = (ptr, val) => (memory.heapi32u[ptr/4] = +val),
            ops.setUInt = (ptr, val) => (memory.heapi32u[ptr/4] = val),
            ops.getUInt = (ptr) => memory.heapi32u[ptr/4],
            ops.getBool = (ptr) => memory.heapi32u[ptr/4],
            ops.encode_handle = (ptr, val) => { setUInt(ptr, spasm.addObject(val)); },      
            ops.decode_handle = (ptr) => { return spasm.objects[getUInt(ptr)]; }
            ops.isDefined = (val) => (val != undefined && val != null)
            ops.spasm_encode_optional_Handle = (ptr, val)=>{
              if (ops.setBool(ptr+4, ops.isDefined(val))) {
                ops.encode_handle(ptr, val);
              }  
            },
            ops.spasm_decode_optional_Handle = (ptr)=>{
              if (ops.getBool(ptr+4)) {
                return ops.decode_handle(ptr, val);
              } else return null;
            }
          }
          break;
        case 4:          
          if (!memory.heapi16s) {
            
            memory.heapi16s = new Int16Array(spasm.memory.buffer)
            ops.setShort = (ptr, val) => (memory.heapi16s[ptr/2] = val),
            ops.getShort = (ptr) => memory.heapi16s[ptr/2]
          }
          break;
        case 5:
          if (!memory.heapi16u) {
            memory.heapi16u = new Uint16Array(spasm.memory.buffer)
            ops.setUShort = (ptr, val) => (memory.heapi16u[ptr/2] = val),
            ops.getUShort = (ptr) => memory.heapi16u[ptr/2]
          }
          break;
        case 6:
          if (!memory.heapi8s) {
            memory.heapi8s = new Int8Array(spasm.memory.buffer)            
            setByte = (ptr, val) => (memory.heapi8s[ptr] = val),
            getByte = (ptr) => memory.heapi8s[ptr]
          }
          break;
        case 7:
          if (!memory.heapi8u) {
            memory.heapi8u = new Uint8Array(spasm.memory.buffer)
            setUByte = (ptr, val) => (memory.heapi8u[ptr] = val),
            getUByte = (ptr) => memory.heapi8u[ptr]
          }
          break;
        case 8:          
          if (!memory.heapf32) {
            memory.heapf32 = new Float32Array(spasm.memory.buffer)                  
            ops.setFloat = (ptr, val) => (memory.heapf32[ptr/4] = val),
            ops.getFloat = (ptr) => memory.heapf32[ptr/4]
          }
          break;
        case 9:          
          if (!memory.heapf64) {
            memory.heapf64 = new Float64Array(spasm.memory.buffer)
            ops.setDouble = (ptr, val) => (memory.heapf64[ptr/8] = val),
            ops.getDouble = (ptr) => memory.heapf64[ptr/8]

          }
          break;
      }
    }
}


export let jsExports = {
  env: {
    JSON_stringify: (rawResult, ctx) => { encoder.string(rawResult, JSON.stringify(spasm.objects[ctx])); },
    JSON_parse_string: (valLen, valOffset) => { return spasm.addObject(JSON.parse(decoder.string(valLen,valOffset)))},
    
    Body_json: (ctx) => {
      return spasm.addObject(spasm.objects[ctx].json());
    },
    Body_text: (ctx) => {
      return spasm.addObject(spasm.objects[ctx].text());
    },
    WindowOrWorkerGlobalScope_fetch_0: (ctx, input) => {
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      
      const spasm_decode_union2_Request_string = (ptr)=>{
        if (ops.getUInt(ptr) == 0) {
          return ops.decode_handle(ptr+4);
        } else if (ops.getUInt(ptr) == 1) {
          return decoder.string(ptr+4);//broken
        }
      };
      return spasm.addObject(spasm.objects[ctx].fetch(spasm_decode_union2_Request_string(input)));
    },
    
    promise_error_6uhandle: (handle, ctx, ptr) => {      
      let ret = spasm.addObject(spasm.objects[handle].catch((r)=>{
        setupMemory([spasm.MemoryIdentifiers.i32u]);
      
        let prev_promise_idx = (handle % 124 + 4)*4;
        let this_param_promise_idx = (ret % 124 + 4)*4;
        ops.encode_handle(this_param_promise_idx,r);
        spasm.instance.exports.__indirect_function_table.get(ptr)(ctx, this_param_promise_idx);
        if (getUInt(prev_promise_idx)) {
          spasm.removeObject(ops.getUInt(prev_promise_idx));
          ops.encode_handle(prev_promise_idx, null);
        }
      }));
      return ret;
    },
    promise_then_6uhandlehandle: (handle, ctx, ptr) => {
      
      let ret = spasm.addObject(spasm.objects[handle].then((r)=>{
        setupMemory([spasm.MemoryIdentifiers.i32u]);
      
        let prev_promise_idx = (handle % 124 + 4)*4;
        let this_ret_promise_idx = (ret % 124 + 4)*4;
        let this_param_promise_idx = (ret % 124 + 4 + 128)*4;
        ops.encode_handle(this_param_promise_idx,r);
        spasm.instance.exports.__indirect_function_table.get(ptr)(this_ret_promise_idx, ctx, this_param_promise_idx);

        ops.encode_handle(this_param_promise_idx, null);
        if (ops.getUInt(prev_promise_idx)) {
          spasm.removeObject(ops.getUInt(prev_promise_idx));
          ops.encode_handle(prev_promise_idx, null);
        }
        return ops.decode_handle(this_ret_promise_idx);
      }));
      return ret;
    },
    promise_then_6uhandlev: (handle, ctx, ptr) => {
      let ret = spasm.addObject(spasm.objects[handle].then((r)=>{
        setupMemory([spasm.MemoryIdentifiers.i32u]);
        let prev_promise_idx = (handle % 126 + 2)*4
        let this_value_idx = (ret % 126 + 2)*4;

        ops.encode_handle(this_value_idx, r);
        spasm.instance.exports.__indirect_function_table.get(ptr)(ctx, this_value_idx);
        
        ops.encode_handle(this_value_idx, null);
        if (ops.getUInt(prev_promise_idx)) {
          spasm.removeObject(ops.getUInt(prev_promise_idx));
          ops.encode_handle(prev_promise_idx, null);
        }
        ops.encode_handle(this_value_idx, null);
      }));
      return ret;
    },
    MouseEvent_clientX_Get: (ctx) => {
      return spasm.objects[ctx].clientX;
    },
    Document_createElement_0: (ctx, localNameLen, localNamePtr) => {
      return spasm.addObject(spasm.objects[ctx].createElement(decoder.string(localNameLen, localNamePtr)));
    },
    Element_innerHTML_Set: (ctx, innerHTMLLen, innerHTMLPtr) => {
      spasm.objects[ctx].innerHTML = decoder.string(innerHTMLLen, innerHTMLPtr);
    },
    /*EventTarget_addEventListener_0: (ctx, typeLen, typePtr, callbackCtx, callbackPtr) => {
      setupMemory();
      nodes[ctx].addEventListener(decoder.string(typeLen, typePtr), (event)=>{encode_handle(0, event);spasm.instance.exports.__indirect_function_table.get(callbackPtr)(callbackCtx, 0)});
    },*/
    Object_Call_OptionalEventHandler__void: (ctx, propLen, propOffset, hasCallback, callbackCtx, callbackPtr) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;  
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      let listenerType = prop.substring(2);
      if (typeof(node.wasmEvents) === "object" 
          && typeof(node.wasmEvents[listenerType]) === "object" 
          && typeof(node.wasmEvents[listenerType].cbs) === "array"
          && node.wasmEvents[listenerType].cbs.length > 0) 
      {
        if (hasCallback)
          console.error(`Deleting ${node.wasmEvents[listenerType].cbs.length} existing event handler(s)`);
        else
          console.error(`Replacing ${node.wasmEvents[listenerType].cbs.length} existing event handler`);
        delete node.wasmEvents[listenerType];
      }
      if (hasCallback) {
        let newEventHandler = (event) => { // returns Any
          ops.encode_handle(0, event);
          spasm.instance.exports.__indirect_function_table.get(callbackPtr)(512, callbackCtx, 0);
          ops.encode_handle(0, null);
          return ops.decode_handle(512);
        }
        node[prop] = newEventHandler;
        if (typeof(node.wasmEventHandlers) !== "object")
          node.wasmEventHandlers = {};
        // save callbackPtr, callbackCtx (uint, uint)
        node.wasmEventHandlers[listenerType] = { ctx: callbackCtx, fun: callbackPtr };
      }
      else {
        if (typeof(node.wasmEventHandlers) === "object"
             && node.wasmEventHandlers[listenerType] === "object")
          delete node.wasmEventHandlers[listenerType];
        node[prop] = null; // delete the event handler
      }
    },
    Object_Call_EventHandler__void: (ctx, propLen, propOffset, callbackCtx, callbackPtr) => {
      jsExports.env.Object_Call_OptionalEventHandler__void(ctx, propLen, propOffset, true, callbackCtx, callbackPtr);
    },
    Object_Getter__EventHandler: (rawResult, ctx, propLen, propOffset) => {
      let node = spasm.objects[ctx];    
      if (typeof(node) === undefined) return;  
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      let listenerType = prop.substring(2);

      if (node.wasmEvents && node.wasmEvents[listenerType]) {
        let cb = node.wasmEvents[listenerType].cbs[0];
        ops.setUInt(rawResult, cb.ctx);
        ops.setUInt(rawResult+4, cb.fun);
      } 
      else if (node.wasmEventHandlers && typeof(node.wasmEventHandlers[listenerType]) === "object")
      {
        let cb = node.wasmEventHandlers[listenerType];
        ops.setUInt(rawResult, cb.ctx);
        ops.setUInt(rawResult+4, cb.fun);
      }
    },
    Object_Getter__OptionalString: (rawResult, ctx, propLen, propOffset) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      
      if (typeof(node[prop]) === "function") {
        let str = node[prop]();
        if (ops.setBool(rawResult+4, ops.isDefined(str)))
          encoders.string(rawResult, str, memory.heapi32u);
      }
      else {
        let str = node[prop]
        if (ops.setBool(rawResult+4, ops.isDefined(str)))
          encoders.string(rawResult, str, memory.heapi32u);
      }
    },
    Object_Getter__OptionalUint: (rawResult, ctx, propLen, propOffset) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      
      if (typeof(node[prop]) === "function") {
        let number = node[prop]();
        if (ops.setBool(rawResult+4, ops.isDefined(number)))
          ops.setUInt(rawResult, number);
      }
      else {
        let number = node[prop]
        if (ops.setBool(rawResult+4, ops.isDefined(number)))
          ops.setUInt(rawResult, number);
      }
    },
    Object_Getter__OptionalDouble: (rawResult, ctx, propLen, propOffset) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.i32u, spasm.MemoryIdentifiers.heapf64]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      
      if (typeof(node[prop]) === "function") {
        let number = node[prop]();
        if (ops.setBool(rawResult+8, ops.isDefined(number)))
          ops.setDouble(rawResult, number);
      }
      else {
        let number = node[prop]
        if (ops.setBool(rawResult+8, ops.isDefined(number)))
          ops.setDouble(rawResult, number);
      }
    },
    Object_Getter__OptionalBool: (rawResult, ctx, propLen, propOffset) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      
      if (typeof(node[prop]) === "function") {
        let number = node[prop]();
        if (ops.setBool(rawResult+4, ops.isDefined(number)))
          ops.setBool(rawResult, number);
      }
      else {
        let number = node[prop]
        if (ops.setBool(rawResult+8, ops.isDefined(number)))
          ops.setBool(rawResult, number);
      }
    },
    Object_Getter__OptionalHandle: (rawResult, ctx, propLen, propOffset) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      
      if (typeof(node[prop]) === "function") {
        let obj = node[prop]();
        ops.spasm_encode_optional_Handle(rawResult, obj)
      }
      else {
        let obj = node[prop];
        ops.spasm_encode_optional_Handle(rawResult, obj)
      }
    },
    Object_Call_string__OptionalString: (rawResult, ctx, propLen, propOffset, argLen, argOffset) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset);
      let arg = decoder.string(argLen, argOffset);
      let str = node[prop](arg);
      
      if (ops.setBool(rawResult+4, ops.isDefined(str)))
        encoders.string(rawResult, str, memory.heapi32u);
    },
    Object_Call_string__OptionalHandle: (rawResult, ctx, propLen, propOffset, argLen, argOffset) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      let arg = decoder.string(argLen, argOffset, memory.heapi32u);
      
      let obj = node[prop](arg);
      ops.spasm_encode_optional_Handle(rawResult, obj);
    },
    Object_Call_uint__OptionalHandle: (rawResult, ctx, propLen, propOffset, arg) => {
      let node = spasm.objects[ctx];
      if (typeof(node) === undefined) return;
      setupMemory([spasm.MemoryIdentifiers.heapi32u]);
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      
      let obj = node[prop](arg);
      ops.spasm_encode_optional_Handle(rawResult, obj);
    },
    Object_Call_int__OptionalHandle: (rawResult, ctx, propLen, propOffset, arg) => {
      jsExports.env.Object_Call_uint__OptionalHandle(rawResult, ctx, propLen, propOffset, arg);
    },
    Object_Call_bool__OptionalHandle: (rawResult, ctx, propLen, propOffset, arg) => {
      jsExports.env.Object_Call_uint__OptionalHandle(rawResult, ctx, propLen, propOffset, arg);
    },
    ldexec: (initVal, commandsLen, commandsOffset, callbackCtx, callbackPtr, errorCtx, errorPtr, mustEvalInitVal = false) => {
      /// executed with Window as context...
      if (mustEvalInitVal)
        var firstArg = eval(initVal);
      else var firstArg = initVal;

      let _ = window._;
      if (!window.sifg) {
        window.sifg = (ptr)=>spasm.instance.exports.__indirect_function_table.get(ptr),
        window.ao = spasm.addObject;
        window.es = encoder.string;
        window.nodes = spasm.objects;
      }
      window.cbPtr = callbackPtr;
      window.cbCtx = callbackCtx;
      var globalThis = this;
      var exec = _.runInContext(globalThis)
      let arg_cleanup = []
      try {
        const commands_str = decoder.string(commandsLen, commandsOffset);
        console.log(commands_str);
        let commands = JSON.parse(commands_str);

        // find locals
        for(let idx in commands) {
          if (commands[idx]['local'] !== undefined) {
            arg_cleanup.push(commands[idx]['local']);
            if (_.startsWith(commands[idx]['value'], '=')) {
              eval.call(globalThis, 'var ' + commands[idx]['local'] + ' = ' + commands[idx]['value'].substring(1) + ';');
            } else if (_.startsWith(commands[idx]['value'], '\\=')) {
              eval.call(globalThis, 'var ' + commands[idx]['local'] + ' = ' + JSON.stringify(commands[idx]['value'].substring(1)) + ';');
            } else {
              eval.call(globalThis, 'var ' + commands[idx]['local'] + ' = ' + JSON.stringify(commands[idx]['value']) + ';');            
            }
          }
        }
        for (let idx in commands) {
          if (commands[idx]['func'] !== undefined) {
            
            if (exec[commands[idx]['func']].length == 0)
            {
              firstArg = exec.invoke(exec, commands[idx]['func']);
              continue;
            }
            else if (commands[idx]['params'].length == 0) {              
              firstArg = exec.invoke(exec, commands[idx]['func'], firstArg);
              continue;
            }

            exec.params = [];
            for (let idx2 in commands[idx]['params']) {
              if (_.startsWith(commands[idx]['params'][idx2], '=')) {
                function fct() { return eval.call(globalThis, commands[idx]['params'][idx2].substring(1)); }
                let fct_guts = fct.call(globalThis);
                exec.params.push(fct_guts);
              }
              else if (_.startsWith(commands[idx]['params'][idx2], '\\=')) {
                exec.params.push(commands[idx]['params'][idx2].substring(1));
              }
              else {
                exec.params.push(commands[idx]['params'][idx2]);                
              }
            }
            firstArg = exec.invoke(exec, commands[idx]['func'], firstArg, ...exec.params);
          }
        }

      } catch (err) {
        if (errorPtr) {
          let hndl = spasm.addObject(err);
          spasm.instance.exports.__indirect_function_table.get(errorPtr)(errorCtx, hndl);
        } else {
          console.error(err);
        }
      }
      for(let idx in arg_cleanup) _.unset(window, arg_cleanup[idx]);
      _.unset(window, 'cbPtr');
      _.unset(window, 'cbCtx');
      return firstArg;

    },
    ldexec_Handle__string: (rawResult, ctx, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      const ret = jsExports.env.ldexec(spasm.objects[ctx], cLen, cOff, cCtx, cPtr, errCtx, errPtr, false);
      encoder.string(rawResult, ret);
    },
    ldexec_Handle__long: (ctx, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return BigInt(jsExports.env.ldexec(spasm.objects[ctx], cLen, cOff, cCtx, cPtr, errCtx, errPtr, false));
    },
    ldexec_Handle__Handle: (ctx, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return spasm.addObject(jsExports.env.ldexec(spasm.objects[ctx], cLen, cOff, cCtx, cPtr, errCtx, errPtr, false));
    },
    ldexec_string__Handle: (strLen, strOff, cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit) => {
      return spasm.addObject(jsExports.env.ldexec(decoder.string(strLen, strOff), cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit));
    },
    ldexec_string__long: (strLen, strOff, cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit) => {
      return BigInt(jsExports.env.ldexec(decoder.string(strLen, strOff), cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit));
    },
    ldexec_string__string: (rawResult, strLen, strOff, cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit) => {
      const ret = jsExports.env.ldexec(decoder.string(strLen, strOff), cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit);
      encoder.string(rawResult, ret);
    },
    ldexec_long__string: (rawResult, num, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      const ret = jsExports.env.ldexec(num, cLen, cOff, cCtx, cPtr, errCtx, errPtr, false);
      encoder.string(rawResult, ret);
    },
    ldexec_long__long: (num, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return BigInt(jsExports.env.ldexec(num, cLen, cOff, cCtx, cPtr, errCtx, errPtr, false));
    },
    ldexec_long__Handle: (num, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return spasm.addObject(jsExports.env.ldexec(num, cLen, cOff, cCtx, cPtr, errCtx, errPtr, false));
    },
    HTMLInputElement_value_Get: (rawResult, ctx) => {
      encoder.string(rawResult, spasm.objects[ctx].value);
    },
    Node_appendChild: (ctx, node) => {
      return spasm.addObject(spasm.objects[ctx].appendChild(spasm.objects[node]));
    },
    ParentNode_querySelector: (rawResult, ctx, selectorsLen, selectorsPtr) => {
      setupMemory([spasm.MemoryIdentifiers.heapi32u]);      
      ops.spasm_encode_optional_Handle(rawResult, spasm.objects[ctx].querySelector(decoder.string(selectorsLen, selectorsPtr, memory.heapi32u)));
    },
    CSSStyleDeclaration_setter__string_string: (ctx, propertyLen, propertyPtr, valueLen, valuePtr) => {
      setupMemory([spasm.MemoryIdentifiers.heapi32u]);
      
      spasm.objects[ctx][decoder.string(propertyLen, propertyPtr, memory.heapi32u)] = decoder.string(valueLen, valuePtr, memory.heapi32u);
    },
    ElementCSSInlineStyle_style_Get: (ctx) => {
      return spasm.addObject(spasm.objects[ctx].style);
    },
    console_log: (data) => {
      console.log(spasm.objects[data]);
    },
    console_info: (data) => {
      console.info(spasm.objects[data]);
    },
    console_error: (data) => {
      console.error(spasm.objects[data]);
    },
  }
}