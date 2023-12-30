declare let window: any
import {
    libwasm as spa,
    encoders as encoder,
    decoders as decoder,
} from './libwasm.js'
import _ from 'lodash'
import moment from 'moment'
window.moment = moment

var libwasm: any = spa
var memory: any = {}
let ops: any = {}

const setupMemory = (cond: any) => {
    var memory: any = {}
    for (let idx in cond) {
        switch (cond[idx]) {
            case 0:
                if (!memory.heapi64u) {
                    memory.heapi64u = new BigUint64Array(libwasm.memory.buffer)
                    ops.setULong = (ptr: number, val: any) =>
                        (memory.heapi64u[ptr / 8] = BigInt(val))
                    ops.getULong = (ptr: number) => memory.heapi64u[ptr / 8]
                }
                break
            case 1:
                if (!memory.heapi64s) {
                    memory.heapi64s = new BigInt64Array(libwasm.memory.buffer)
                    ops.setLong = (ptr: number, val: any) =>
                        (memory.heapi64s[ptr / 8] = BigInt(val))
                    ops.getLong = (ptr: number) => memory.heapi64s[ptr / 8]
                }
                break
            case 2:
                if (!memory.heapi32s) {
                    memory.heapi32s = new Int32Array(libwasm.memory.buffer)
                    ops.setInt = (ptr: number, val: any) =>
                        (memory.heapi32s[ptr / 4] = val)
                    ops.getInt = (ptr: number) => memory.heapi32s[ptr / 4]
                }
                break
            case 3:
                if (!memory.heapi32u) {
                    memory.heapi32u = new Uint32Array(libwasm.memory.buffer)
                    ops.setBool = (ptr: number, val: any) =>
                        (memory.heapi32u[ptr / 4] = +val)
                    ops.setUInt = (ptr: number, val: any) =>
                        (memory.heapi32u[ptr / 4] = val)
                    ops.getUInt = (ptr: number) => memory.heapi32u[ptr / 4]
                    ops.getBool = (ptr: number) => memory.heapi32u[ptr / 4]
                    ops.encode_handle = (ptr: number, val: any) => {
                        ops.setUInt(ptr, libwasm.addObject(val))
                    }
                    ops.decode_handle = (ptr: number) => {
                        return libwasm.objects[ops.getUInt(ptr)]
                    }
                    ops.isDefined = (val: any) =>
                        val != undefined && val != null
                    ops.libwasm_encode_optional_Handle = (
                        ptr: number,
                        val: any
                    ) => {
                        if (ops.setBool(ptr + 4, ops.isDefined(val))) {
                            ops.encode_handle(ptr, val)
                        }
                    }
                    ops.libwasm_decode_optional_Handle = (ptr: number) => {
                        if (ops.getBool(ptr + 4)) {
                            return ops.decode_handle(ptr)
                        } else return null
                    }
                }
                break
            case 4:
                if (!memory.heapi16s) {
                    memory.heapi16s = new Int16Array(libwasm.memory.buffer)
                    ops.setShort = (ptr: number, val: any) =>
                        (memory.heapi16s[ptr / 2] = val)
                    ops.getShort = (ptr: number) => memory.heapi16s[ptr / 2]
                }
                break
            case 5:
                if (!memory.heapi16u) {
                    memory.heapi16u = new Uint16Array(libwasm.memory.buffer)
                    ops.setUShort = (ptr: number, val: any) =>
                        (memory.heapi16u[ptr / 2] = val)
                    ops.getUShort = (ptr: number) => memory.heapi16u[ptr / 2]
                }
                break
            case 6:
                if (!memory.heapi8s) {
                    memory.heapi8s = new Int8Array(libwasm.memory.buffer)
                    ops.setByte = (ptr: number, val: any) =>
                        (memory.heapi8s[ptr] = val)
                    ops.getByte = (ptr: number) => memory.heapi8s[ptr]
                }
                break
            case 7:
                if (!memory.heapi8u) {
                    memory.heapi8u = new Uint8Array(libwasm.memory.buffer)
                    ops.setUByte = (ptr: number, val: any) =>
                        (memory.heapi8u[ptr] = val)
                    ops.getUByte = (ptr: number) => memory.heapi8u[ptr]
                }
                break
            case 8:
                if (!memory.heapf32) {
                    memory.heapf32 = new Float32Array(libwasm.memory.buffer)
                    ops.setFloat = (ptr: number, val: any) =>
                        (memory.heapf32[ptr / 4] = val)
                    ops.getFloat = (ptr: number) => memory.heapf32[ptr / 4]
                }
                break
            case 9:
                if (!memory.heapf64) {
                    memory.heapf64 = new Float64Array(libwasm.memory.buffer)
                    ops.setDouble = (ptr: number, val: any) =>
                        (memory.heapf64[ptr / 8] = val)
                    ops.getDouble = (ptr: number) => memory.heapf64[ptr / 8]
                }
                break
        }
    }
}

const Object_VarArgCall = (
    nodePtr: number,
    propLen: number,
    propOffset: number,
    argsdefLen: number,
    argsdefOffset: number,
    jsonArgsLen: number,
    jsonArgsOffset: number
) => {
    console.log(nodePtr)
    console.log(propLen)
    console.log(propOffset)
    console.log(argsdefLen)
    console.log(argsdefOffset)
    console.log(jsonArgsLen)
    console.log(jsonArgsOffset)

    setupMemory([libwasm.MemoryIdentifiers.i32u])
    let node: any = libwasm.objects[nodePtr]
    let prop: string = decoder.string(propLen, propOffset, memory.heapi32u)
    let argsdef: string = decoder.string(
        argsdefLen,
        argsdefOffset,
        memory.heapi32u
    )
    console.log(argsdef)
    let jsonArgs: string = decoder.string(
        jsonArgsLen,
        jsonArgsOffset,
        memory.heapi32u
    )
    console.log(jsonArgs)
    let args: any = JSON.parse(jsonArgs)
    let argsdef_arr: any = argsdef.split(';')
    let args_arr: any = []
    let j = 0
    let next_val_is_null = false
    for (let i = 0; i < argsdef_arr.length; i++) {
        //console.log(argsdef_arr);
        //console.log(j);
        //console.log(argsdef_arr[i]);
        if (argsdef_arr[i].startsWith('Optional!')) {
            //console.log(args[j]);
            if (!args[j]) next_val_is_null = true
            argsdef_arr[i] = argsdef_arr[i].replace('Optional!', '')
            if (argsdef_arr[i].startsWith('('))
                argsdef_arr[i] = argsdef_arr[i].substr(
                    1,
                    argsdef_arr[j].length - 2
                )

            j++
        }

        //console.log(argsdef_arr[i]);
        if (argsdef_arr[i].startsWith('SumType!')) {
            let str = argsdef_arr[j]
            let argsdef_sumtype_arr = str
                .substr(
                    str.lastIndexOf('(') + 1,
                    str.indexOf(')') - str.lastIndexOf('(') - 1
                )
                .split(',')
            let chosen_type = args[j]
            //console.log("Chosen type: ", chosen_type);
            j++
            //console.log(argsdef_sumtype_arr);

            for (let k = 0; k < argsdef_sumtype_arr.length; k++) {
                if (k != chosen_type) continue
                //console.log(args[j])
                //console.log("Pushing");
                if (argsdef_sumtype_arr[k].startsWith('Handle')) {
                    //console.log("Pushing: ", args[j][k], " j: ", j, " k: ", k);
                    if (!next_val_is_null)
                        args_arr.push(libwasm.objects[args[j][k]])
                } else {
                    //console.log("Pushing: ", args[j][k], " j: ", j, " k: ", k);
                    if (!next_val_is_null) args_arr.push(args[j][k])
                }
                break
            }
            j++
        } else if (argsdef_arr[i].startsWith('Handle')) {
            if (!next_val_is_null) args_arr.push(libwasm.objects[args[j]])
            j++
        } else {
            if (!next_val_is_null) args_arr.push(args[j])
            j++
        }

        next_val_is_null = false
    }

    //console.log(`_.spread(${node[prop]}, ${JSON.stringify(args_arr)})`)
    let ret_obj = node[prop].call(node, ...args_arr)
    return ret_obj
}

export let jsExports = {
    env: {
        JSON_stringify: (rawResult: number, ctx: number) => {
            encoder.string(rawResult, JSON.stringify(libwasm.objects[ctx]))
        },
        JSON_parse_string: (valLen: number, valOffset: number) => {
            return libwasm.addObject(
                JSON.parse(decoder.string(valLen, valOffset))
            )
        },

        setTimeout: (ctx: number, func: number, ms: number) => {
            return setTimeout(() => {
                libwasm.instance.exports.jsCallback0(ctx, func)
            }, ms)
        },
        clearTimeout: (id: number) => {
            clearTimeout(id)
        },
        setInterval: (ctx: number, func: number, ms: number) => {
            return setInterval(() => {
                libwasm.instance.exports.jsCallback0(ctx, func)
            }, ms)
        },
        clearInterval: (id: number) => {
            clearInterval(id)
        },
        libwasm_copyObjectRef: (ctx: number) => {
            return libwasm.addObject(libwasm.objects[ctx])
        },

        setAttribute: (
            node: number,
            attrLen: number,
            attrOffset: number,
            valueLen: number,
            valueOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            const attr = decoder.string(attrLen, attrOffset, memory.heapi32u)
            const value = decoder.string(valueLen, valueOffset, memory.heapi32u)
            libwasm.objects[node].setAttribute(attr, value)
        },
        WindowOrWorkerGlobalScope_setInterval__Handle_int_Handle: (
            window_hndl: number,
            CbCtx: number,
            CbPtr: number,
            ms: number,
            args: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            return window.setInterval(
                (param: any) => {
                    setupMemory([libwasm.MemoryIdentifiers.i32u])
                    ops.encode_handle(0, param)
                    libwasm.instance.exports.__indirect_function_table.get(
                        CbPtr
                    )(512, CbCtx, 0)
                    ops.encode_handle(0, null)
                    return ops.decode_handle(512)
                },
                ms,
                libwasm.objects[args]
            )
        },
        WindowOrWorkerGlobalScope_setTimeout__Handle_int_Handle: (
            window_hndl: number,
            CbCtx: number,
            CbPtr: number,
            ms: number,
            args: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            return window.setTimeout(
                (param: any) => {
                    setupMemory([libwasm.MemoryIdentifiers.i32u])
                    ops.encode_handle(0, param)
                    libwasm.instance.exports.__indirect_function_table.get(
                        CbPtr
                    )(512, CbCtx, 0)
                    ops.encode_handle(0, null)
                    return ops.decode_handle(512)
                },
                ms,
                libwasm.objects[args]
            )
        },
        Body_json: (ctx: number) => {
            return libwasm.addObject(libwasm.objects[ctx].json())
        },
        Body_text: (ctx: number) => {
            return libwasm.addObject(libwasm.objects[ctx].text())
        },
        promise_error_6uhandle: (handle: number, ctx: number, ptr: number) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let ret = libwasm.addObject(
                libwasm.objects[handle].catch((r: any) => {
                    setupMemory([libwasm.MemoryIdentifiers.i32u])
                    let prev_promise_idx = ((handle % 124) + 4) * 4
                    let this_param_promise_idx = ((ret % 124) + 4) * 4
                    ops.encode_handle(this_param_promise_idx, r)
                    libwasm.instance.exports.__indirect_function_table.get(ptr)(
                        ctx,
                        this_param_promise_idx
                    )
                    if (ops.getUInt(prev_promise_idx)) {
                        libwasm.removeObject(ops.getUInt(prev_promise_idx))
                        ops.encode_handle(prev_promise_idx, null)
                    }
                })
            )
            return ret
        },
        promise_then_6uhandlehandle: (
            handle: number,
            ctx: number,
            ptr: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let ret = libwasm.addObject(
                libwasm.objects[handle].then((r: any) => {
                    setupMemory([libwasm.MemoryIdentifiers.i32u])
                    let prev_promise_idx = ((handle % 124) + 4) * 4
                    let this_ret_promise_idx = ((ret % 124) + 4) * 4
                    let this_param_promise_idx = ((ret % 124) + 4 + 128) * 4
                    ops.encode_handle(this_param_promise_idx, r)
                    libwasm.instance.exports.__indirect_function_table.get(ptr)(
                        this_ret_promise_idx,
                        ctx,
                        this_param_promise_idx
                    )

                    ops.encode_handle(this_param_promise_idx, null)
                    if (ops.getUInt(prev_promise_idx)) {
                        libwasm.removeObject(ops.getUInt(prev_promise_idx))
                        ops.encode_handle(prev_promise_idx, null)
                    }
                    return ops.decode_handle(this_ret_promise_idx)
                })
            )
            return ret
        },
        promise_then_6uhandlev: (handle: number, ctx: number, ptr: number) => {
            let ret = libwasm.addObject(
                libwasm.objects[handle].then((r: any) => {
                    setupMemory([libwasm.MemoryIdentifiers.i32u])
                    let prev_promise_idx = ((handle % 124) + 4) * 4
                    let this_value_idx = ((ret % 124) + 4) * 4

                    ops.encode_handle(this_value_idx, r)
                    libwasm.instance.exports.__indirect_function_table.get(ptr)(
                        ctx,
                        this_value_idx
                    )

                    ops.encode_handle(this_value_idx, null)
                    if (ops.getUInt(prev_promise_idx)) {
                        libwasm.removeObject(ops.getUInt(prev_promise_idx))
                        ops.encode_handle(prev_promise_idx, null)
                    }
                    ops.encode_handle(this_value_idx, null)
                })
            )
            return ret
        },
        MouseEvent_clientX_Get: (ctx: number) => {
            return libwasm.objects[ctx].clientX
        },
        Document_createElement_0: (
            ctx: number,
            localNameLen: number,
            localNamePtr: number
        ) => {
            return libwasm.addObject(
                libwasm.objects[ctx].createElement(
                    decoder.string(localNameLen, localNamePtr)
                )
            )
        },
        Element_innerHTML_Set: (
            ctx: number,
            innerHTMLLen: number,
            innerHTMLPtr: number
        ) => {
            libwasm.objects[ctx].innerHTML = decoder.string(
                innerHTMLLen,
                innerHTMLPtr
            )
        },

        EventTarget_addEventListener_0: (
            ctx: number,
            typeLen: number,
            typePtr: number,
            callbackCtx: number,
            callbackPtr: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            libwasm.objects[ctx].addEventListener(
                decoder.string(typeLen, typePtr),
                (event: any) => {
                    ops.encode_handle(0, event)
                    libwasm.instance.exports.__indirect_function_table.get(
                        callbackPtr
                    )(callbackCtx, 0)
                }
            )
        },
        EventTarget_removeEventListener_0: (
            ctx: number,
            typeLen: number,
            typePtr: number,
            callbackCtx: number,
            callbackPtr: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            libwasm.objects[ctx].removeEventListener(
                decoder.string(typeLen, typePtr),
                (event: any) => {
                    ops.encode_handle(0, event)
                    libwasm.instance.exports.__indirect_function_table.get(
                        callbackPtr
                    )(callbackCtx, 0)
                }
            )
        },

        Object_VarArgCall__bool: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__void: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__int: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__uint: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__string: (
            resultRaw: number,
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return encoder.string(
                resultRaw,
                Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
            )
        },
        Object_VarArgCall__float: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__double: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__short: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__long: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__ulong: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__ushort: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            return Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
        },
        Object_VarArgCall__Handle: (
            a1: number,
            a2: number,
            a3: number,
            a4: number,
            a5: number,
            a6: number,
            a7: number
        ) => {
            let added_obj = libwasm.addObject(
                Object_VarArgCall(a1, a2, a3, a4, a5, a6, a7)
            )
            return added_obj
        },

        Object_Call_string__void: (
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            if (typeof node[prop] === 'function') node[prop](arg)
            else node[prop] = arg
        },
        Object_Call_string_string__void: (
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number,
            arg2Len: number,
            arg2Offset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            let arg2 = decoder.string(arg2Len, arg2Offset, memory.heapi32u)
            node[prop](arg, arg2)
        },
        Object_Call_string_uint__void: (
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number,
            arg2: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            node[prop](arg, arg2)
        },
        Object_Call_string__Handle: (
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            return libwasm.addObject(node[prop](arg))
        },
        Object_Call_string__bool: (
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            return node[prop](arg)
        },
        Object_Call_string__string: (
            rawResult: number,
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            encoder.string(rawResult, node[prop](arg))
        },
        Object_Call_string_string__Handle: (
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number,
            arg2len: number,
            arg2Offset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            let arg2 = decoder.string(arg2len, arg2Offset, memory.heapi32u)
            return libwasm.addObject(node[prop](arg, arg2))
        },
        Object_Call_string_uint__Handle: (
            nodePtr: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number,
            arg2: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let node = libwasm.objects[nodePtr]
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            return libwasm.addObject(node[prop](arg, arg2))
        },
        Object_Call_EventHandler__void: (
            ctx: number,
            propLen: number,
            propOffset: number,
            hasCallback: number,
            callbackCtx: number,
            callbackPtr: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let listenerType = prop.substring(2)
            if (
                typeof node.wasmEvents === 'object' &&
                typeof node.wasmEvents[listenerType] === 'object' &&
                typeof node.wasmEvents[listenerType].cbs === 'object' &&
                node.wasmEvents[listenerType].cbs.length > 0
            ) {
                if (!!hasCallback)
                    console.error(
                        `Deleting ${node.wasmEvents[listenerType].cbs.length} existing event handler(s)`
                    )
                else
                    console.error(
                        `Replacing ${node.wasmEvents[listenerType].cbs.length} existing event handler`
                    )
                delete node.wasmEvents[listenerType]
            }
            if (!!hasCallback) {
                let newEventHandler = (event: any) => {
                    // returns Any
                    setupMemory([libwasm.MemoryIdentifiers.i32u])
                    ops.encode_handle(0, event)
                    libwasm.instance.exports.__indirect_function_table.get(
                        callbackPtr
                    )(512, callbackCtx, 0)
                    ops.encode_handle(0, null)
                    return ops.decode_handle(512)
                }
                node[prop] = newEventHandler
                if (typeof node.wasmEventHandlers !== 'object')
                    node.wasmEventHandlers = {}
                // save callbackPtr, callbackCtx (uint, uint)
                node.wasmEventHandlers[listenerType] = {
                    ctx: callbackCtx,
                    fun: callbackPtr,
                }
            } else {
                if (
                    typeof node.wasmEventHandlers === 'object' &&
                    node.wasmEventHandlers[listenerType] === 'object'
                )
                    delete node.wasmEventHandlers[listenerType]
                node[prop] = null // delete the event handler
            }
        },
        // todo: test this:
        Object_Getter__EventHandler: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let listenerType = prop.substring(2)

            if (node.wasmEvents && node.wasmEvents[listenerType]) {
                let cb = node.wasmEvents[listenerType].cbs[0]
                ops.setUInt(rawResult, cb.fun)
                ops.setUInt(rawResult + 4, cb.ctx)
                ops.setBool(rawResult + 8, ops.isDefined(cb.fun))
            } else if (
                node.wasmEventHandlers &&
                typeof node.wasmEventHandlers[listenerType] === 'object'
            ) {
                let cb = node.wasmEventHandlers[listenerType]
                ops.setUInt(rawResult, cb.fun)
                ops.setUInt(rawResult + 4, cb.ctx)
                ops.setBool(rawResult + 8, ops.isDefined(cb.fun)) // does the bool go after?
            }
        },
        Object_Getter__OptionalString: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)

            if (typeof node[prop] === 'function') {
                let str = node[prop]()
                if (ops.setBool(rawResult + 4, ops.isDefined(str)))
                    encoder.string(rawResult, str, memory.heapi32u)
            } else {
                let str = node[prop]
                if (ops.setBool(rawResult + 4, ops.isDefined(str)))
                    encoder.string(rawResult, str, memory.heapi32u)
            }
        },
        Object_Getter__OptionalUint: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)

            if (typeof node[prop] === 'function') {
                let number = node[prop]()
                if (ops.setBool(rawResult + 4, ops.isDefined(number)))
                    ops.setUInt(rawResult, number)
            } else {
                let number = node[prop]
                if (ops.setBool(rawResult + 4, ops.isDefined(number)))
                    ops.setUInt(rawResult, number)
            }
        },
        Object_Getter__OptionalDouble: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([
                libwasm.MemoryIdentifiers.i32u,
                libwasm.MemoryIdentifiers.heapf64,
            ])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)

            if (typeof node[prop] === 'function') {
                let number = node[prop]()
                if (ops.setBool(rawResult + 8, ops.isDefined(number)))
                    ops.setDouble(rawResult, number)
            } else {
                let number = node[prop]
                if (ops.setBool(rawResult + 8, ops.isDefined(number)))
                    ops.setDouble(rawResult, number)
            }
        },
        Object_Getter__OptionalBool: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)

            if (typeof node[prop] === 'function') {
                let number = node[prop]()
                if (ops.setBool(rawResult + 4, ops.isDefined(number)))
                    ops.setBool(rawResult, number)
            } else {
                let number = node[prop]
                if (ops.setBool(rawResult + 8, ops.isDefined(number)))
                    ops.setBool(rawResult, number)
            }
        },
        Object_Getter__OptionalHandle: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)

            if (typeof node[prop] === 'function') {
                let obj = node[prop]()
                ops.libwasm_encode_optional_Handle(rawResult, obj)
            } else {
                let obj = node[prop]
                ops.libwasm_encode_optional_Handle(rawResult, obj)
            }
        },
        Static_Call_Handle__void: (
            objLen: number,
            objOffset: number,
            propLen: number,
            propOffset: number,
            arg: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let obj = decoder.string(objLen, objOffset, memory.heapi32u)
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg_obj = libwasm.objects[arg]
            if (obj == 'console') {
                ;(console as any)[prop](arg_obj)
            }
        },
        Static_Call_string__void: (
            objLen: number,
            objOffset: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let obj = decoder.string(objLen, objOffset, memory.heapi32u)
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            if (obj == 'console') {
                ;(console as any)[prop](arg)
            }
        },
        Static_Call__void: (
            objLen: number,
            objOffset: number,
            propLen: number,
            propOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let obj = decoder.string(objLen, objOffset, memory.heapi32u)
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            if (obj == 'console') {
                ;(console as any)[prop]()
            }
        },
        Static_Getter__Handle: (
            objLen: number,
            objOffset: number,
            propLen: number,
            propOffset: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let obj = decoder.string(objLen, objOffset, memory.heapi32u)
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            if (obj == 'console') {
                if (typeof (console as any)[prop] === 'function')
                    return libwasm.addObject((console as any)[prop]())
                else return libwasm.addObject((console as any)[prop])
            }
        },
        Object_Call_string__OptionalString: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)
            let str = node[prop](arg)

            if (ops.setBool(rawResult + 4, ops.isDefined(str)))
                encoder.string(rawResult, str, memory.heapi32u)
        },
        Object_Call_string__OptionalHandle: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number,
            argLen: number,
            argOffset: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.i32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)
            let arg = decoder.string(argLen, argOffset, memory.heapi32u)

            let obj = node[prop](arg)
            ops.libwasm_encode_optional_Handle(rawResult, obj)
        },
        Object_Call_uint__OptionalHandle: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number,
            arg: number
        ) => {
            let node = libwasm.objects[ctx]
            if (typeof node === undefined) return
            setupMemory([libwasm.MemoryIdentifiers.heapi32u])
            let prop = decoder.string(propLen, propOffset, memory.heapi32u)

            let obj = node[prop](arg)
            ops.libwasm_encode_optional_Handle(rawResult, obj)
        },
        Object_Call_int__OptionalHandle: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number,
            arg: number
        ) => {
            jsExports.env.Object_Call_uint__OptionalHandle(
                rawResult,
                ctx,
                propLen,
                propOffset,
                arg
            )
        },
        Object_Call_bool__OptionalHandle: (
            rawResult: number,
            ctx: number,
            propLen: number,
            propOffset: number,
            arg: number
        ) => {
            jsExports.env.Object_Call_uint__OptionalHandle(
                rawResult,
                ctx,
                propLen,
                propOffset,
                arg
            )
        },
        ldexec: (
            initVal: any,
            commandsLen: number,
            commandsOffset: number,
            callbackCtx: number,
            callbackPtr: number,
            errorCtx: number,
            errorPtr: number,
            mustEvalInitVal = false
        ) => {
            /// executed with Window as context...
            let firstArg
            const _ = window._
            if (mustEvalInitVal) {
                if (
                    _.last(initVal) != ';' &&
                    !_.includes(initVal, '(') &&
                    !_.includes(initVal, '{')
                )
                    firstArg = _.get(window, initVal) // try a variable query (singleton?)
                if (firstArg === undefined) firstArg = eval(initVal)
            } else firstArg = initVal

            if (callbackPtr > 0) {
                window.cbPtr = callbackPtr
                window.cbCtx = callbackCtx
            }
            let arg_cleanup: any = []
            let params: any = []
            try {
                // this part is expensive enough to suggest large queries
                const commands_str = decoder.string(
                    commandsLen,
                    commandsOffset,
                    memory.heapi32u
                )
                const commands = JSON.parse(commands_str)
                //
                console.log(commands_str)
                // find locals
                for (let idx in commands) {
                    if (commands[idx]['local'] !== undefined) {
                        let key: string = commands[idx]['local']
                        let value: string = commands[idx]['value']
                        arg_cleanup.push(key)
                        if (value[0] == '=') {
                            if (value[1] == '(') {
                                if (!window.libwasm.precompiled)
                                    window.libwasm.precompiled = {}
                                let precompiled =
                                    window.libwasm.precompiled[value]
                                if (!precompiled) {
                                    let res = eval.call(
                                        null,
                                        value.substring(1)
                                    )
                                    if (typeof res === 'function')
                                        window.libwasm.precompiled[value] = res
                                    window[key] = res
                                } else window[key] = precompiled
                            } else {
                                if (value[1] == 't' && value == '=true')
                                    window[key] = true
                                else if (value[1] == 'f' && value == '=false')
                                    window[key] = false
                                else if (value[1] == 'n' && value == '=null')
                                    window[key] = null
                                else if (
                                    value[1] == 'u' &&
                                    value == '=undefined'
                                )
                                    window[key] = undefined
                                else if (value[1] >= '0' && value[1] <= '9')
                                    window[key] = parseInt(value.substring(1))
                                else if (
                                    value[1] != '{' &&
                                    !_.includes(value, '(') &&
                                    _.last(value) != ';'
                                )
                                    window[key] = _.get(
                                        window,
                                        value.substring(1)
                                    )

                                if (window[key] === undefined)
                                    // fall back to eval
                                    window[key] = eval.call(
                                        null,
                                        value.substring(1)
                                    )
                            }
                        } else if (value[0] == '\\' && value[1] == '=')
                            window[key] = value.substring(2)
                        else window[key] = value
                    }
                }
                for (let idx in commands) {
                    if (commands[idx]['func'] !== undefined) {
                        let func = commands[idx]['func']
                        if (commands[idx]['params'].length == 0) {
                            // 1 parameter call, it's a chain

                            firstArg = _.invoke(_, func, firstArg)
                            continue
                        }
                        params = []
                        let idx2: any
                        for (idx2 in commands[idx]['params']) {
                            let value = commands[idx]['params'][idx2]
                            //if (value.length == 0) continue;
                            if (value[0] == '=') {
                                if (value[1] == '(') {
                                    if (!window.libwasm.precompiled)
                                        window.libwasm.precompiled = {}
                                    let precompiled =
                                        window.libwasm.precompiled[value]
                                    if (!precompiled) {
                                        // this is a function, eval() it
                                        let res = eval.call(
                                            null,
                                            value.substring(1)
                                        )
                                        if (typeof res === 'function')
                                            window.libwasm.precompiled[value] =
                                                res
                                        params.push(res)
                                    } else params.push(precompiled)
                                } else {
                                    if (value[1] == 't' && value == '=true')
                                        params.push(true)
                                    else if (
                                        value[1] == 'f' &&
                                        value == '=false'
                                    )
                                        params.push(false)
                                    else if (value[1] >= '0' && value[1] <= '9')
                                        params.push(
                                            parseInt(value.substring(1))
                                        )
                                    else if (
                                        value[1] == 'n' &&
                                        value == '=null'
                                    )
                                        params.push(null)
                                    else if (
                                        value[1] == 'u' &&
                                        value == '=undefined'
                                    )
                                        params.push(undefined)
                                    else if (
                                        value[1] != '{' &&
                                        !_.includes(value, '(') &&
                                        _.last(value) != ';'
                                    )
                                        params.push(
                                            _.get(window, value.substring(1))
                                        )

                                    if (params[idx2] === undefined)
                                        params[idx2] = eval.call(
                                            null,
                                            value.substring(1)
                                        )
                                }
                            } else if (value[0] == '\\' && value[1] == '=') {
                                params.push(value.substring(2))
                            } else {
                                params.push(value)
                            }
                        }
                        firstArg = _.invoke(_, func, firstArg, ...params)
                    }
                }
            } catch (err) {
                if (errorPtr > 0) {
                    let hndl = libwasm.addObject(err)
                    libwasm.instance.exports.__indirect_function_table.get(
                        errorPtr
                    )(errorCtx, hndl)
                } else {
                    console.error(err)
                }
            }
            for (let idx in arg_cleanup) _.unset(window, arg_cleanup[idx])
            if (callbackPtr > 0) {
                _.unset(window, 'cbPtr')
                _.unset(window, 'cbCtx')
            }
            return firstArg
        },
        ldexec_Handle__string: (
            rawResult: number,
            ctx: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            const ret = jsExports.env.ldexec(
                libwasm.objects[ctx],
                cLen,
                cOff,
                cCtx,
                cPtr,
                errCtx,
                errPtr,
                false
            )
            encoder.string(rawResult, ret)
        },
        ldexec_Handle__long: (
            ctx: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            return BigInt(
                jsExports.env.ldexec(
                    libwasm.objects[ctx],
                    cLen,
                    cOff,
                    cCtx,
                    cPtr,
                    errCtx,
                    errPtr,
                    false
                )
            )
        },
        ldexec_Handle__double: (
            ctx: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            return jsExports.env.ldexec(
                libwasm.objects[ctx],
                cLen,
                cOff,
                cCtx,
                cPtr,
                errCtx,
                errPtr,
                false
            )
        },
        ldexec_Handle__Handle: (
            ctx: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            return libwasm.addObject(
                jsExports.env.ldexec(
                    libwasm.objects[ctx],
                    cLen,
                    cOff,
                    cCtx,
                    cPtr,
                    errCtx,
                    errPtr,
                    false
                )
            )
        },
        ldexec_string__Handle: (
            strLen: number,
            strOff: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number,
            evalInit: number
        ) => {
            memory.heapi32u = new Uint32Array(libwasm.memory.buffer)
            return libwasm.addObject(
                jsExports.env.ldexec(
                    decoder.string(strLen, strOff, memory.heapi32u),
                    cLen,
                    cOff,
                    cCtx,
                    cPtr,
                    errCtx,
                    errPtr,
                    !!evalInit
                )
            )
        },
        ldexec_string__long: (
            strLen: number,
            strOff: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number,
            evalInit: number
        ) => {
            memory.heapi32u = new Uint32Array(libwasm.memory.buffer)
            return BigInt(
                jsExports.env.ldexec(
                    decoder.string(strLen, strOff, memory.heapi32u),
                    cLen,
                    cOff,
                    cCtx,
                    cPtr,
                    errCtx,
                    errPtr,
                    !!evalInit
                )
            )
        },
        ldexec_string__double: (
            strLen: number,
            strOff: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number,
            evalInit: number
        ) => {
            memory.heapi32u = new Uint32Array(libwasm.memory.buffer)
            return jsExports.env.ldexec(
                decoder.string(strLen, strOff, memory.heapi32u),
                cLen,
                cOff,
                cCtx,
                cPtr,
                errCtx,
                errPtr,
                !!evalInit
            )
        },
        ldexec_string__string: (
            rawResult: number,
            strLen: number,
            strOff: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number,
            evalInit: number
        ) => {
            memory.heapi32u = new Uint32Array(libwasm.memory.buffer)
            const ret = jsExports.env.ldexec(
                decoder.string(strLen, strOff, memory.heapi32u),
                cLen,
                cOff,
                cCtx,
                cPtr,
                errCtx,
                errPtr,
                !!evalInit
            )
            encoder.string(rawResult, ret, memory.heapi32u)
        },
        ldexec_long__string: (
            rawResult: number,
            num: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            memory.heapi32u = new Uint32Array(libwasm.memory.buffer)
            const ret = jsExports.env.ldexec(
                num,
                cLen,
                cOff,
                cCtx,
                cPtr,
                errCtx,
                errPtr,
                false
            )
            encoder.string(rawResult, ret, memory.heapi32u)
        },
        ldexec_long__long: (
            num: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            return BigInt(
                jsExports.env.ldexec(
                    num,
                    cLen,
                    cOff,
                    cCtx,
                    cPtr,
                    errCtx,
                    errPtr,
                    false
                )
            )
        },
        ldexec_long__double: (
            num: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            return jsExports.env.ldexec(
                num,
                cLen,
                cOff,
                cCtx,
                cPtr,
                errCtx,
                errPtr,
                false
            )
        },
        ldexec_long__Handle: (
            num: number,
            cLen: number,
            cOff: number,
            cCtx: number,
            cPtr: number,
            errCtx: number,
            errPtr: number
        ) => {
            return libwasm.addObject(
                jsExports.env.ldexec(
                    num,
                    cLen,
                    cOff,
                    cCtx,
                    cPtr,
                    errCtx,
                    errPtr,
                    false
                )
            )
        },
        HTMLInputElement_value_Get: (rawResult: number, ctx: number) => {
            encoder.string(rawResult, libwasm.objects[ctx].value)
        },
        Node_appendChild: (ctx: number, node: number) => {
            return libwasm.addObject(
                libwasm.objects[ctx].appendChild(libwasm.objects[node])
            )
        },
        ParentNode_querySelector: (
            rawResult: number,
            ctx: number,
            selectorsLen: number,
            selectorsPtr: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.heapi32u])
            ops.libwasm_encode_optional_Handle(
                rawResult,
                libwasm.objects[ctx].querySelector(
                    decoder.string(selectorsLen, selectorsPtr, memory.heapi32u)
                )
            )
        },
        CSSStyleDeclaration_setter__string_string: (
            ctx: number,
            propertyLen: number,
            propertyPtr: number,
            valueLen: number,
            valuePtr: number
        ) => {
            setupMemory([libwasm.MemoryIdentifiers.heapi32u])

            libwasm.objects[ctx][
                decoder.string(propertyLen, propertyPtr, memory.heapi32u)
            ] = decoder.string(valueLen, valuePtr, memory.heapi32u)
        },
        ElementCSSInlineStyle_style_Get: (ctx: number) => {
            return libwasm.addObject(libwasm.objects[ctx].style)
        },
        console_log: (data: number) => {
            console.log(libwasm.objects[data])
        },
        console_info: (data: number) => {
            console.info(libwasm.objects[data])
        },
        console_error: (data: number) => {
            console.error(libwasm.objects[data])
        },
    },
}
