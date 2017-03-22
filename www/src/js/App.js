import Client from './components/Client';
import Editor from './components/Editor';
import Keybindings from './components/Keybindings';
import Spreadsheet from './components/Spreadsheet';

export default function App() {
    this._div = null;
    this.keybindings = new Keybindings();
    this.client = new Client();
}

App.prototype.div = function(value) {
    if ( ! value ) return this._div;
    this._div = value;
    return this;
};

App.prototype.render = function() {
    var editorDiv = d3.select('#editor').node();
    this.editor      = new Editor().div(editorDiv).render();
    this.editor.evaluator(function(code) { eval(code); });
    var editor = this.editor;
    this.keybindings.bind('e e', function(e) {
        editor.eval();
        return false;
    });
    return this;
};
