// File is autogenerated with `dub run libwasm:bootstrap-webpack`
import _ from 'lodash';
import {libwasm as spa, decoders as decoder, encoders as encoder} from './libwasm.js';

let libwasm = spa;
const eventHandler = (event) => {
    const handlers = event.currentTarget.wasmEvents[event.type];
    const cbs = handlers.cbs;
    
    cbs.forEach(cb=>{
        let idx = libwasm.addObject(event);
        libwasm.instance.exports.domEvent(cb.ctx, cb.fun, idx);
    });
};
export let jsExports = {
    env: {
        KeyboardEvent_key_Get: (rawResult, ctx) => {
          console.log(ctx);
          console.log(libwasm.objects);
          encoder.string(rawResult, libwasm.objects[ctx].key);
        },
        appendChild: (parent, child) => {
            libwasm.objects[parent].appendChild(libwasm.objects[child]);
        },
        insertBefore: (parent, child, sibling) => {
            libwasm.objects[parent].insertBefore(libwasm.objects[child], libwasm.objects[sibling]);
        },
        addCss: (cssLen, cssOffset) => {
            var style = document.createElement('style');
            style.type = 'text/css';
            style.innerHTML = decoder.string(cssLen, cssOffset);
            document.getElementsByTagName('head')[0].appendChild(style);
            libwasm.addObject(style);
        },
        addClass: (node, classLen, classOffset) => {
            libwasm.objects[node].classList.add(decoder.string(classLen, classOffset));
        },
        removeClass: (node, classLen, classOffset) => {
            libwasm.objects[node].classList.remove(decoder.string(classLen, classOffset));
        },
        changeClass: (node, classLen, classOffset, on) => {
            if (on)
                libwasm.objects[node].classList.add(decoder.string(classLen, classOffset));
            else
                libwasm.objects[node].classList.remove(decoder.string(classLen, classOffset));
        },
        unmount: (childPtr) => {
            var child = libwasm.objects[childPtr];
            child.parentNode.removeChild(child);
        },
        removeChild: (childPtr) => {
            var child = libwasm.objects[childPtr];
            child.parentNode.removeChild(child);
            // TODO: we can reuse the child node (it is cheaper than recreating a new one...)
        },
        logObjects: () => {
            console.log(libwasm.objects);
            console.log(libwasm.freelists);
        },
        getRoot: () => {
            return libwasm.addObject(document.querySelector("#root"));
        },
        createElement: (type) => {
            const tags = ["a","abbr","address","area","article","aside","audio","b","base","bdi","bdo","blockquote","body","br","button","canvas","caption","cite","code","col","colgroup","data","datalist","dd","del","dfn","div","dl","dt","em","embed","fieldset","figcaption","figure","footer","form","h1","h2","h3","h4","h5","h6","head","header","hr","html","i","iframe","img","input","ins","kbd","keygen","label","legend","li","link","main","map","mark","meta","meter","nav","noscript","object","ol","optgroup","option","output","p","param","pre","progress","q","rb","rp","rt","rtc","ruby","s","samp","script","section","select","small","source","span","strong","style","sub","sup","table","tbody","td","template","textarea","tfoot","th","thead","time","title","tr","track","u","ul","var","video","wbr"];
            const getTagFromType = (type) => {
                return tags[type];
            }
            return libwasm.addObject(document.createElement(getTagFromType(type)));
        },
        setSelectionRange: (nodePtr, start, end) => {
            libwasm.objects[nodePtr].setSelectionRange(start, end);
        },
        innerText: (nodePtr,textLen, textOffset) => {
            libwasm.objects[nodePtr].innerText = decoder.string(textLen,textOffset);
        },
        setAttributeInt: (node, attrLen, attrOffset, value) => {
            const attr = decoder.string(attrLen,attrOffset);
            libwasm.objects[node].setAttribute(attr, value);
        },
        getTimeStamp: () => {
            return BigInt(window._.now());
        },       
        addEventListener: (nodePtr, listenerType, ctx, fun, eventType) => {
            let events = ['click','change','input','keydown','keyup','dblclick','blur','mousemove','mouseup','mousedown','keypress','focus'];
            console.log("Add event listener");
            console.log(listenerType);
            console.log(events[listenerType]);
            let listenerTypeStr = events[listenerType];
            let node = libwasm.objects[nodePtr];
            let existing_cb;
            if (typeof(node.wasmEventHandlers) === "object" 
                    && typeof(node.wasmEventHandlers[listenerType]) === "object") 
                {
                    console.warning(`Node had existing event handler(s):`);
                    console.warning(node);
                    existing_cb = node.wasmEventHandlers[listenerType];
                    delete node.wasmEventHandlers[listenerType];
                }
            if (node.wasmEvents === undefined)
                var nodeEvents = node.wasmEvents = {};
            else
                var nodeEvents = libwasm.objects[nodePtr].wasmEvents;
            if (nodeEvents[listenerTypeStr] && nodeEvents[listenerTypeStr].cbs.length > 0) {
                nodeEvents[listenerTypeStr].cbs.push({ctx:ctx,fun:fun});
            } else {
                nodeEvents[listenerTypeStr] = {cbs:[{ctx: ctx, fun: fun}], eventType: eventType};
                if (existing_cb) nodeEvents[listenerTypeStr].cbs.push(existing_cb);
                node.addEventListener(listenerTypeStr, eventHandler);
            }
        },
        removeEventListener: (nodePtr, listenerType, ctx, fun, eventType) => {
            let events = ['click','change','input','keydown','keyup','dblclick','blur','mousemove','mouseup','mousedown','keypress','focus'];

            var listenerTypeStr = events[listenerType];
            var node = libwasm.objects[nodePtr];
            if (node.wasmEvents === undefined)
                return;
            var nodeEvents = libwasm.objects[nodePtr].wasmEvents;
            if (nodeEvents[listenerTypeStr] && nodeEvents[listenerTypeStr].cbs.length > 0) {
                nodeEvents[listenerTypeStr].cbs = nodeEvents[listenerTypeStr].cbs.filter(cb=>!(cb.ctx==ctx && cb.fun==fun));
            }
        },
        setPropertyBool: (nodePtr, propLen, propOffset, value) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (node && node[prop] !== undefined)
                node[prop] = value;
        },
        setPropertyInt: (nodePtr, propLen, propOffset, value) => {
            jsExports.env.setPropertyBool(nodePtr, propLen, propOffset, value);
        },
        setProperty: (nodePtr, propLen, propOffset, valueLen, valueOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (node && node[prop] !== undefined) {
                node[prop] = decoder.string(valueLen, valueOffset);
            }
        },
        getPropertyInt: (nodePtr, propLen, propOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (!node || node[prop] === undefined)
                return false;
            return +node[prop];
        },
        getPropertyBool: (nodePtr, propLen, propOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (!node || node[prop] === undefined)
                return false;
            return !!node[prop];
        },
        getProperty: (resultRaw, nodePtr, propLen, propOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (!node || node[prop] === undefined)
                return encoder.string(resultRaw,"");
            return encoder.string(resultRaw,node[prop]);
        },
        Object_Call__void: (nodePtr, propLen, propOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            node[prop]();
        },
        Object_Call_uint__void: (nodePtr, propLen, propOffset, arg) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (typeof(node[prop]) === "function")
                node[prop](arg);
            else 
                node[prop] = arg;
            
        },
        Object_Call_int__void: (nodePtr, propLen, propOffset, arg) => {
            jsExports.env.Object_Call_uint__void(nodePtr, propLen, propOffset, arg);
        },
        Object_Call_bool__void: (nodePtr, propLen, propOffset, arg) => {
            jsExports.env.Object_Call_uint__void(nodePtr, propLen, propOffset, arg);
        },
        Object_Call_double__void: (nodePtr, propLen, propOffset, arg) => {
            jsExports.env.Object_Call_uint__void(nodePtr, propLen, propOffset, arg);
        },
        Object_Call_float__void: (nodePtr, propLen, propOffset, arg) => {
            jsExports.env.Object_Call_uint__void(nodePtr, propLen, propOffset, arg);
        },
        Object_Call_handle__void: (nodePtr, propLen, propOffset, handle) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            
            if (typeof(node[prop]) === "function" )
                node[prop](libwasm.objects[handle]);
            else
                node[prop] = libwasm.objects[handle];
        },
        Object_Call_double_double__void: (nodePtr, propLen, propOffset, arg, arg2) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            node[prop](arg, arg2);
        },
        Object_Getter__Handle: (nodePtr, propLen, propOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (typeof(node[prop]) === "function")
                return libwasm.addObject(node[prop]());
            else 
                return libwasm.addObject(node[prop]);
            
        },
        Object_Getter__string: (rawResult, nodePtr, propLen, propOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (typeof(node[prop]) === "function")
                encoder.string(rawResult, node[prop]());                
            else 
                encoder.string(rawResult, node[prop]);
        },
        Object_Getter__int: (nodePtr, propLen, propOffset) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            if (typeof(node[prop]) === "function")
                return node[prop]();
            else 
                return node[prop];
        },
        Object_Getter__uint: (nodePtr, propLen, propOffset) => {            
            return jsExports.env.Object_Getter__int(nodePtr, propLen, propOffset);
        },
        Object_Getter__ushort: (nodePtr, propLen, propOffset) => {            
            return jsExports.env.Object_Getter__int(nodePtr, propLen, propOffset);
        },
        Object_Getter__bool: (nodePtr, propLen, propOffset) => {            
            return jsExports.env.Object_Getter__int(nodePtr, propLen, propOffset);
        },
        Object_Getter__float: (nodePtr, propLen, propOffset) => {            
            return jsExports.env.Object_Getter__int(nodePtr, propLen, propOffset);
        },
        Object_Getter__double: (nodePtr, propLen, propOffset) => {            
            return jsExports.env.Object_Getter__int(nodePtr, propLen, propOffset);
        },

        Object_Call_uint__Handle: (nodePtr, propLen, propOffset, arg) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            return libwasm.addObject(node[prop](arg));
        },
        Object_Call_int__Handle: (nodePtr, propLen, propOffset, arg) => {
            return jsExports.env.Object_Call_uint__Handle(nodePtr, propLen, propOffset, arg);
        },
        Object_Call_bool__Handle: (nodePtr, propLen, propOffset, arg) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            return libwasm.addObject(node[prop](arg));
        },
        Object_Call_uint__string: (rawResult, nodePtr, propLen, propOffset, arg) => {
            
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            encoder.string(rawResult, node[prop](arg));
        },
        Object_Call_handle__Handle: (nodePtr, propLen, propOffset, handle) => {
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            return libwasm.addObject(node[prop](libwasm.objects[handle]));
        },
        Object_Call_uint_uint__string: (rawResult, nodePtr, propLen, propOffset, arg, arg2) => {
            
            let node = libwasm.objects[nodePtr];
            let prop = decoder.string(propLen, propOffset);
            encoder.string(rawResult, node[prop](arg, arg2));
        }
    }
}

if (process.env.NODE_ENV === 'development') {
    function reload() {
        const root = document.querySelector("#root");
        // TODO: how do we handle outstanding setTimeout or other schedule functions?
        // For now we assume the same callbacks will be available in the reloaded module
        // but that may not be the case.
        for(var i = libwasm.lastPtr; i > 3; i--) {
            if (libwasm.objects[i].remove)
                libwasm.objects[i].remove();
            delete libwasm.objects[i];
        }
        libwasm.lastPtr = 2;
        libwasm.init();
    }
    const ws = new WebSocket('ws://localhost:3001');
    ws.onmessage = function(event) {
        if (event.data === 'reload') {
            if (!libwasm.instance.exports.dumpApp || !libwasm.instance.exports.loadApp)
                return;
            libwasm.instance.exports.dumpApp(0);
            var state = decoder.string(0);
            reload();
            setTimeout(()=>{
                encoder.string(0, state);
                const heapi32u = new Uint32Array(libwasm.memory.buffer)
                libwasm.instance.exports.loadApp(heapi32u[0], heapi32u[1]);
            }, 1);
        }
    }
}