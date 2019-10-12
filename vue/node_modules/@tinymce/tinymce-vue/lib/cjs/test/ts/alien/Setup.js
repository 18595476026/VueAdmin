"use strict";
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
Object.defineProperty(exports, "__esModule", { value: true });
var agar_1 = require("@ephox/agar");
var katamari_1 = require("@ephox/katamari");
var sugar_1 = require("@ephox/sugar");
var index_1 = require("src/main/ts/index");
var TinyMCE_1 = require("src/main/ts/TinyMCE");
require("tinymce");
var vue_1 = require("vue");
var setTinymceBaseUrl = function (baseUrl) {
    var tinymce = TinyMCE_1.getTinymce();
    var prefix = document.location.protocol + '//' + document.location.host;
    tinymce.baseURL = baseUrl.indexOf('://') === -1 ? prefix + baseUrl : baseUrl;
    tinymce.baseURI = new tinymce.util.URI(tinymce.baseURL);
};
var setup = function (props, onLoaded) {
    return agar_1.Step.async(function (done) {
        var root = sugar_1.Element.fromTag('div');
        var mountPoint = sugar_1.Element.fromTag('div');
        sugar_1.Insert.append(root, mountPoint);
        sugar_1.Insert.append(sugar_1.Body.body(), root);
        // TODO: use editor base_url init config
        setTinymceBaseUrl("/project/node_modules/tinymce");
        var originalInit = props.init || {};
        var originalSetup = originalInit.setup || katamari_1.Fun.noop;
        var propsData = __assign({}, props, { init: __assign({}, originalInit, { setup: function (editor) {
                    originalSetup(editor);
                    editor.on('SkinLoaded', function () {
                        setTimeout(function () {
                            onLoaded(editor, viewModel, teardown);
                        }, 0);
                    });
                } }) });
        var EditorConstructor = vue_1.default.extend(index_1.default);
        var viewModel = new EditorConstructor({ propsData: propsData }).$mount(mountPoint.dom());
        var teardown = function () {
            viewModel.$destroy();
            sugar_1.Remove.remove(root);
            done();
        };
    });
};
exports.setup = setup;
