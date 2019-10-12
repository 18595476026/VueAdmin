"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var agar_1 = require("@ephox/agar");
var bedrock_1 = require("@ephox/bedrock");
var Setup_1 = require("../alien/Setup");
bedrock_1.UnitTest.asynctest('InitTest', function (success, failure) {
    agar_1.Pipeline.async({}, [
        agar_1.Logger.t('Should be able to setup editor', agar_1.GeneralSteps.sequence([
            Setup_1.setup({}, function (editor, viewModel, done) {
                done();
            })
        ])),
        agar_1.Logger.t('Should be able to setup editor in inline mode via inline prop', agar_1.GeneralSteps.sequence([
            Setup_1.setup({ inline: true }, function (editor, viewModel, done) {
                agar_1.Assertions.assertEq('Editor should be inline', true, editor.inline);
                done();
            })
        ])),
        agar_1.Logger.t('Should be able to setup editor in inline mode via init data', agar_1.GeneralSteps.sequence([
            Setup_1.setup({ init: { inline: true } }, function (editor, viewModel, done) {
                agar_1.Assertions.assertEq('Editor should be inline', true, editor.inline);
                done();
            })
        ])),
    ], success, failure);
});
