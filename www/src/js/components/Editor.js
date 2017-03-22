export default function Editor() {
  this._div = null;
  this._codeMirror = null;
  this._evaluator;
}

Editor.prototype.div = function(value) {
  if ( ! value ) return this._div;
  this._div = value;
  return this;
};

Editor.prototype.evaluator = function(value) {
  if ( ! value ) return this._evaluator;
  this._evaluator = value;
  return this;
};

Editor.prototype.render = function () {
  this._codeMirror = CodeMirror(this.div(), {
    mode:  "javascript",
    lineNumbers: true,
    viewportMargin: Infinity,
    keyMap: 'emacs',
    theme: 'monokai'
  });
  return this;
};

Editor.prototype.buffer = function(value) {
  if ( ! value ) return this._codeMirror.doc.getValue();
  this._codeMirror.doc.setValue(value);
  return this;
};

Editor.prototype.eval = function () {
  var code = this.buffer();
  this.evaluator()(code);
  return this;
};
