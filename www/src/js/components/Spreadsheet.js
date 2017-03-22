export default function Spreadsheet() {
    this._div = null;
    this._handsontable = null;
}

Spreadsheet.prototype.div = function(value) {
    if ( ! value ) return this._div;
    this._div = value;
    return this;
};

Spreadsheet.prototype.render = function () {
    this._handsontable = new Handsontable(this.div(), {
        data: Handsontable.helper.createSpreadsheetData(1000, 1000),
        width: 600,
        height: 420,
        colWidths: 42,
        rowHeights: 30,
        rowHeaders: true,
        colHeaders: true
    });
    return this;
};
