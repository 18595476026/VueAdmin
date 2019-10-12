import { Step } from '@ephox/agar';
import { IPropTypes } from 'src/main/ts/components/EditorPropTypes';
import 'tinymce';
declare type SetupCallback = (editor: any, viewModel: any, done: any) => void;
declare const setup: (props: Partial<IPropTypes>, onLoaded: SetupCallback) => Step<{}, {}>;
export { setup };
