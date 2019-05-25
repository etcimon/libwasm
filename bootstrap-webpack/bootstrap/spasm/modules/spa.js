// File is autogenerated with `dub run spasm:webpack-bootstrap`
import {spasm as spa, decoders as decoder, encoders as encoder} from './spasm.js';

let spasm = spa;
const nodes = spasm.objects;

const addPtr = spasm.addObject;
let tags = ["a","abbr","address","area","article","aside","audio","b","base","bdi","bdo","blockquote","body","br","button","canvas","caption","cite","code","col","colgroup","data","datalist","dd","del","dfn","div","dl","dt","em","embed","fieldset","figcaption","figure","footer","form","h1","h2","h3","h4","h5","h6","head","header","hr","html","i","iframe","img","input","ins","kbd","keygen","label","legend","li","link","main","map","mark","meta","meter","nav","noscript","object","ol","optgroup","option","output","p","param","pre","progress","q","rb","rp","rt","rtc","ruby","s","samp","script","section","select","small","source","span","strong","style","sub","sup","table","tbody","td","template","textarea","tfoot","th","thead","time","title","tr","track","u","ul","var","video","wbr"];
const getTagFromType = (type) => {
    return tags[type];
}

let events = ['click','change','input','keydown','keyup','dblclick','blur','mousemove','mouseup','mousedown','keypress'];

let currentEvent= null;

const eventHandler = (event) => {
    const id = event.currentTarget.wasmId;
    const handlers = event.currentTarget.wasmEvents[event.type];
    const cbs = handlers.cbs;
    currentEvent = event;
    cbs.forEach(cb=>spasm.instance.exports.domEvent(id, cb.ctx, cb.fun, handlers.eventType));
    currentEvent = null;
}

export { nodes, addPtr };
export let jsExports = {
    appendChild: (parent, child) => {
        nodes[parent].appendChild(nodes[child]);
    },
    insertBefore: (parent, child, sibling) => {
        nodes[parent].insertBefore(nodes[child], nodes[sibling]);
    },
    addCss: (cssLen, cssOffset) => {
        var style = document.createElement('style');
        style.type = 'text/css';
        style.innerHTML = decoder.string(cssLen, cssOffset);
        document.getElementsByTagName('head')[0].appendChild(style);
        addPtr(style);
    },
    addClass: (node, classLen, classOffset) => {
        nodes[node].classList.add(decoder.string(classLen, classOffset));
    },
    removeClass: (node, classLen, classOffset) => {
        nodes[node].classList.remove(decoder.string(classLen, classOffset));
    },
    changeClass: (node, classLen, classOffset, on) => {
        if (on)
            nodes[node].classList.add(decoder.string(classLen, classOffset));
        else
            nodes[node].classList.remove(decoder.string(classLen, classOffset));
    },
    unmount: (childPtr) => {
        var child = nodes[childPtr];
        child.parentNode.removeChild(child);
    },
    removeChild: (childPtr) => {
        var child = nodes[childPtr];
        child.parentNode.removeChild(child);
        // TODO: we can reuse the child node (it is cheaper than recreating a new one...)
    },
    getRoot: () => {
        return addPtr(document.querySelector("#root"));
    },
    createElement: (type) => {
        return addPtr(document.createElement(getTagFromType(type)));
    },
    focus: (nodePtr) => {
        nodes[nodePtr].focus();
    },
    setSelectionRange: (nodePtr, start, end) => {
        nodes[nodePtr].setSelectionRange(start, end);
    },
    innerText: (nodePtr,textLen, textOffset) => {
        nodes[nodePtr].innerText = decoder.string(textLen,textOffset);
    },
    setAttributeInt: (node, attrLen, attrOffset, value) => {
        const attr = decoder.string(attrLen,attrOffset);
        nodes[node].setAttribute(attr, value);
    },
    setAttribute: (node, attrLen, attrOffset, valueLen, valueOffset) => {
        const attr = decoder.string(attrLen,attrOffset);
        const value = decoder.string(valueLen,valueOffset);
        nodes[node].setAttribute(attr, value);
    },
    addEventListener: (nodePtr, listenerType, ctx, fun, eventType) => {
        var listenerTypeStr = events[listenerType];
        var node = nodes[nodePtr];
        if (node.wasmEvents === undefined)
            var nodeEvents = node.wasmEvents = {};
        else
            var nodeEvents = nodes[nodePtr].wasmEvents;
        if (nodeEvents[listenerTypeStr] && nodeEvents[listenerTypeStr].cbs.length > 0) {
            nodeEvents[listenerTypeStr].cbs.push({ctx:ctx,fun:fun});
        } else {
            nodeEvents[listenerTypeStr] = {cbs:[{ctx: ctx, fun: fun}], eventType: eventType};
            node.addEventListener(listenerTypeStr, eventHandler);
        }
    },
    removeEventListener: (nodePtr, listenerType, ctx, fun, eventType) => {
        var listenerTypeStr = events[listenerType];
        var node = nodes[nodePtr];
        if (node.wasmEvents === undefined)
            return;
        var nodeEvents = nodes[nodePtr].wasmEvents;
        if (nodeEvents[listenerTypeStr] && nodeEvents[listenerTypeStr].cbs.length > 0) {
            nodeEvents[listenerTypeStr].cbs = nodeEvents[listenerTypeStr].cbs.filter(cb=>!(cb.ctx==ctx && cb.fun==fun));
        }
    },
    getEventBool: (propLen, propOffset) => {
        return !!currentEvent[decoder.string(propLen,propOffset)];
    },
    getEventInt: (propLen,propOffset) => {
        return 0+currentEvent[decoder.string(propLen,propOffset)];
    },
    getEventString: (resultRaw, propLen,propOffset) => {
        return encoder.string(resultRaw, currentEvent[decoder.string(propLen,propOffset)]);
    },
    setPropertyBool: (nodePtr, propLen, propOffset, value) => {
        const node = nodes[nodePtr];
        const prop = decoder.string(propLen, propOffset);
        if (node && node[prop] !== undefined)
            node[prop] = value;
    },
    setPropertyInt: (nodePtr, propLen, propOffset, value) => {
        jsExports.setPropertyBool(nodePtr, propLen, propOffset, value);
    },
    setProperty: (nodePtr, propLen, propOffset, valueLen, valueOffset) => {
        const node = nodes[nodePtr];
        const prop = decoder.string(propLen, propOffset);
        if (node && node[prop] !== undefined) {
            node[prop] = decoder.string(valueLen, valueOffset);
        }
    },
    getPropertyInt: (nodePtr, propLen, propOffset) => {
        const node = nodes[nodePtr];
        const prop = decoder.string(propLen, propOffset);
        if (!node || node[prop] === undefined)
            return false;
        return +node[prop];
    },
    getPropertyBool: (nodePtr, propLen, propOffset) => {
        const node = nodes[nodePtr];
        const prop = decoder.string(propLen, propOffset);
        if (!node || node[prop] === undefined)
            return false;
        return !!node[prop];
    },
    getProperty: (resultRaw, nodePtr, propLen, propOffset) => {
        const node = nodes[nodePtr];
        const prop = decoder.string(propLen, propOffset);
        if (!node || node[prop] === undefined)
            return encoder.string(resultRaw,"");
        return encoder.string(resultRaw,node[prop]);
    },
}

if (process.env.NODE_ENV === 'development') {
    function reload() {
        const root = document.querySelector("#root");
        // TODO: how do we handle outstanding setTimeout or other schedule functions?
        // For now we assume the same callbacks will be available in the reloaded module
        // but that may not be the case.
        for(var i = spasm.lastPtr; i > 3; i--) {
            if (spasm.objects[i].remove)
                spasm.objects[i].remove();
            delete spasm.objects[i];
        }
        spasm.lastPtr = 2;
        spasm.init();
    }
    const ws = new WebSocket('ws://localhost:3001');
    ws.onmessage = function(event) {
        if (event.data === 'reload') {
            if (!spasm.instance.exports.dumpApp || !spasm.instance.exports.loadApp)
                return;
            spasm.instance.exports.dumpApp(0);
            var state = decoder.string(0);
            reload();
            setTimeout(()=>{
                encoder.string(0, state);
                spasm.instance.exports.loadApp(spasm.heapi32u[0], spasm.heapi32u[1]);
            }, 1);
        }
    }
}
