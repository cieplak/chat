export default function Keybindings() {
    this.bindings = {};
}

Keybindings.prototype.bind = function(keyStroke, operation) {
    this.bindings[keyStroke] = operation;
    Mousetrap.bind(keyStroke, operation);
    return this;
};
