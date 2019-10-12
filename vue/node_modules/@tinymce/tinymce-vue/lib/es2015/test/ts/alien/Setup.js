var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
import { Step } from '@ephox/agar';
import { Fun } from '@ephox/katamari';
import { Body, Element, Insert, Remove } from '@ephox/sugar';
import Editor from 'src/main/ts/index';
import { getTinymce } from 'src/main/ts/TinyMCE';
import 'tinymce';
import Vue from 'vue';
var setTinymceBaseUrl = function (baseUrl) {
    var tinymce = getTinymce();
    var prefix = document.location.protocol + '//' + document.location.host;
    tinymce.baseURL = baseUrl.indexOf('://') === -1 ? prefix + baseUrl : baseUrl;
    tinymce.baseURI = new tinymce.util.URI(tinymce.baseURL);
};
var setup = function (props, onLoaded) {
    return Step.async(function (done) {
        var root = Element.fromTag('div');
        var mountPoint = Element.fromTag('div');
        Insert.append(root, mountPoint);
        Insert.append(Body.body(), root);
        // TODO: use editor base_url init config
        setTinymceBaseUrl("/project/node_modules/tinymce");
        var originalInit = props.init || {};
        var originalSetup = originalInit.setup || Fun.noop;
        var propsData = __assign({}, props, { init: __assign({}, originalInit, { setup: function (editor) {
                    originalSetup(editor);
                    editor.on('SkinLoaded', function () {
                        setTimeout(function () {
                            onLoaded(editor, viewModel, teardown);
                        }, 0);
                    });
                } }) });
        var EditorConstructor = Vue.extend(Editor);
        var viewModel = new EditorConstructor({ propsData: propsData }).$mount(mountPoint.dom());
        var teardown = function () {
            viewModel.$destroy();
            Remove.remove(root);
            done();
        };
    });
};
export { setup };
