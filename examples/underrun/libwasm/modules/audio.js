import {libwasm} from './libwasm.js';

let objects = libwasm.objects;
let addObject = libwasm.addObject;

export let jsExports = {
    env: {
        baseAudioContextDestination: function(ctx) {
            return addObject(objects[ctx].destination);
        },
        audioBufferSourceNodeLoopSet(ctx, loop) {
            objects[ctx].loop = !!loop;
        },
        audioBufferSourceNodeConnect(node, destination) {
            objects[node].connect(objects[destination]);
        },
        audioBufferSourceNodeStart(node) {
            objects[node].start();
        },
        audioBufferSourceNodeBuffer(node, buffer) {
            objects[node].buffer = objects[buffer];
        },
        windowNewAudioContext: function() {
            return addObject(new (window.webkitAudioContext||window.AudioContext)());
        },
        baseAudioContextCreateBuffer: function(handle, nChannels, length, sRate) {
            return addObject(objects[handle].createBuffer(nChannels, length, sRate));
        },
        audioBufferGetChannelData: function(handle, channel) {
            return addObject(objects[handle].getChannelData(channel));
        },
        float32ArraySet: function(handle, length, ptr) {
            let buffer = new Float32Array(libwasm.memory.buffer, ptr, length);
            objects[handle].set(buffer);
        },
        baseAudioContextCreateBufferSource: function(ctx) {
            return addObject(objects[ctx].createBufferSource());
        }
    }
};
