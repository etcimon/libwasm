import {spasm as spa, encoders as encoder, decoders as decoder} from '../modules/spasm.js';
import {_} from 'lodash';
import moment from 'moment';
window.moment = moment;
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
            ops.encode_handle = (ptr, val) => { ops.setUInt(ptr, spasm.addObject(val)); },      
            ops.decode_handle = (ptr) => { return spasm.objects[ops.getUInt(ptr)]; }
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
    WindowOrWorkerGlobalScope_setTimeout__string_int_Handle: async(CbCtx, CbPtr, ms) =>{
      
      console.log("Sleeping");
      
      sleep(5000);
      await new Promise(resolve => setTimeout(resolve, ms));
      console.log("Await done");       
      return null;
    },
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

    WindowOrWorkerGlobalScope_fetch: (ctx, input, riHndl) => {
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      console.log("Got handle for ri: ");
      console.log(riHndl);
      const spasm_decode_union2_Request_string = (ptr)=>{
        if (ops.getUInt(ptr) == 0) {
          return ops.decode_handle(ptr+4);
        } else if (ops.getUInt(ptr) == 1) {
          return decoder.string(ptr+4);//broken
        }
      };
      return spasm.addObject(spasm.objects[ctx].fetch(spasm_decode_union2_Request_string(input), spasm.objects[riHndl]));
    },
    
    promise_error_6uhandle: (handle, ctx, ptr) => {      
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let ret = spasm.addObject(spasm.objects[handle].catch((r)=>{
      
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
      setupMemory([spasm.MemoryIdentifiers.i32u]);
      let ret = spasm.addObject(spasm.objects[handle].then((r)=>{
      
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
        let prev_promise_idx = (handle % 124 + 4)*4
        let this_value_idx = (ret % 124 + 4)*4;

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
      let prop = decoder.string(propLen, propOffset, memory.heapi32u);
      let arg = decoder.string(argLen, argOffset, memory.heapi32u);
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
      let firstArg;
      if (mustEvalInitVal) {
        if (_.last(initVal) != ';' && !_.includes(initVal, '(') && !_.includes(initVal, '{'))
          firstArg = _.get(window, initVal); // try a variable query (singleton?)
        if (firstArg === undefined) firstArg = eval(initVal);
      }
      else firstArg = initVal;

      if (callbackPtr > 0) {
        window.cbPtr = callbackPtr;
        window.cbCtx = callbackCtx;
      }
      const _ = window._;
      let arg_cleanup = []
      let params = [];
      try {
        // this part is expensive enough to suggest large queries
        const commands_str = decoder.string(commandsLen, commandsOffset, memory.heapi32u);
        const commands = JSON.parse(commands_str);
        //
        console.log(commands_str);
        // find locals
        for(let idx in commands) {
          if (commands[idx]['local'] !== undefined) {
            let key = commands[idx]['local'];
            let value = commands[idx]['value'];
            arg_cleanup.push(key);
            if (value[0] == '=') {
              if (value[1] == '(') {
                if (!window.spasm.precompiled) window.spasm.precompiled = {};
                let precompiled = window.spasm.precompiled[value]
                if (!precompiled) { 
                  let res = eval.call(null, value.substring(1));
                  if (typeof(res) === "function") 
                    window.spasm.precompiled[value] = res;
                  window[key] = res;
                } else window[key] = precompiled;
              } else {
                if (value[1] == 't' && value == '=true')
                  window[key] = true;
                else if (value[1] == 'f' && value == '=false')
                  window[key] = false;
                else if (value[1] == 'n' && value == '=null')
                  window[key] = null;
                else if (value[1] == 'u' && value == '=undefined')
                  window[key] = undefined;
                else if (value[1] >= '0' && value[1] <= '9')
                  window[key] = parseInt(value.substring(1));
                else if (value[1] != '{' && !_.includes(value, '(') && _.last(value) != ';')
                  window[key] = _.get(window, value.substring(1));                
                
                if (window[key] === undefined) // fall back to eval
                  window[key] = eval.call(null, value.substring(1));
              }
               
            } 
            else if (value[0] == '\\' && value[1] == '=' ) 
              window[key] = value.substring(2);
            else  
              window[key] = value;                       
            
          }
        }
        for (let idx in commands) {
          if (commands[idx]['func'] !== undefined) {
            let func = commands[idx]['func'];
            if (commands[idx]['params'].length == 0) { // 1 parameter call, it's a chain         
             
               firstArg = _.invoke(_, func, firstArg);
              continue;
            }
            params = [];
            for (let idx2 in commands[idx]['params']) {
              let value = commands[idx]['params'][idx2];
              //if (value.length == 0) continue;
              if (value[0] == '=') {
                if (value[1] == '(') {
                  if (!window.spasm.precompiled) window.spasm.precompiled = {};
                  let precompiled = window.spasm.precompiled[value]
                  if (!precompiled) { 
                    // this is a function, eval() it
                    let res = eval.call(null, value.substring(1));   
                    if (typeof(res) === "function")                
                      window.spasm.precompiled[value] = res;
                    params.push(res); 
                  } 
                  else params.push(precompiled);

                } else {                    
                  if (value[1] == 't' && value == '=true')
                    params.push(true);
                  else if (value[1] == 'f' && value == '=false')
                    params.push(false);
                  else if (value[1] >= '0' && value[1] <= '9')
                    params.push(parseInt(value.substring(1)));
                  else if (value[1] == 'n' && value == '=null')
                    params.push(null);
                  else if (value[1] == 'u' && value == '=undefined')
                    params.push(undefined);
                  else if (value[1] != '{' && !_.includes(value, '(') && _.last(value) != ';')
                      params.push(_.get(window, value.substring(1)));                
                  
                  if (params[idx2] === undefined) 
                    params[idx2] = eval.call(null, value.substring(1));
                }
              }
              else if (value[0] == '\\' && value[1] == '=') { 
                params.push(value.substring(2));
              }
              else {
                params.push(value);                
              }
            }
            firstArg = _.invoke(_, func, firstArg, ...params);
          }
        }

      } catch (err) {
        if (errorPtr > 0) {
          let hndl = spasm.addObject(err);
          spasm.instance.exports.__indirect_function_table.get(errorPtr)(errorCtx, hndl);
        } else {
          console.error(err);
        }
      }
      for(let idx in arg_cleanup) _.unset(window, arg_cleanup[idx]);
      if (callbackPtr > 0) {
        _.unset(window, 'cbPtr');
        _.unset(window, 'cbCtx');
      }
      return firstArg;

    },
    ldexec_Handle__string: (rawResult, ctx, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      const ret = jsExports.env.ldexec(spasm.objects[ctx], cLen, cOff, cCtx, cPtr, errCtx, errPtr, false);
      encoder.string(rawResult, ret);
    },
    ldexec_Handle__long: (ctx, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return BigInt(jsExports.env.ldexec(spasm.objects[ctx], cLen, cOff, cCtx, cPtr, errCtx, errPtr, false));
    },
    ldexec_Handle__double: (ctx, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return jsExports.env.ldexec(spasm.objects[ctx], cLen, cOff, cCtx, cPtr, errCtx, errPtr, false);
    },
    ldexec_Handle__Handle: (ctx, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return spasm.addObject(jsExports.env.ldexec(spasm.objects[ctx], cLen, cOff, cCtx, cPtr, errCtx, errPtr, false));
    },
    ldexec_string__Handle: (strLen, strOff, cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit) => {
      
      memory.heapi32u = new Uint32Array(spasm.memory.buffer)
      return spasm.addObject(jsExports.env.ldexec(decoder.string(strLen, strOff, memory.heapi32u), cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit));
    },
    ldexec_string__long: (strLen, strOff, cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit) => {
      
      memory.heapi32u = new Uint32Array(spasm.memory.buffer)
      return BigInt(jsExports.env.ldexec(decoder.string(strLen, strOff, memory.heapi32u), cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit));
    },
    ldexec_string__double: (strLen, strOff, cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit) => {
      
      memory.heapi32u = new Uint32Array(spasm.memory.buffer)
      return jsExports.env.ldexec(decoder.string(strLen, strOff, memory.heapi32u), cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit);
    },
    ldexec_string__string: (rawResult, strLen, strOff, cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit) => {
      memory.heapi32u = new Uint32Array(spasm.memory.buffer) 
      const ret = jsExports.env.ldexec(decoder.string(strLen, strOff, memory.heapi32u), cLen, cOff, cCtx, cPtr, errCtx, errPtr, evalInit);
      encoder.string(rawResult, ret, memory.heapi32u);
    },
    ldexec_long__string: (rawResult, num, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      
      memory.heapi32u = new Uint32Array(spasm.memory.buffer)
      const ret = jsExports.env.ldexec(num, cLen, cOff, cCtx, cPtr, errCtx, errPtr, false);
      encoder.string(rawResult, ret, memory.heapi32u);
    },
    ldexec_long__long: (num, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return BigInt(jsExports.env.ldexec(num, cLen, cOff, cCtx, cPtr, errCtx, errPtr, false));
    },
    ldexec_long__double: (num, cLen, cOff, cCtx, cPtr, errCtx, errPtr) => {
      return jsExports.env.ldexec(num, cLen, cOff, cCtx, cPtr, errCtx, errPtr, false);
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