BUILD=/tmp/build

package:
	mkdir -p $(BUILD)  || echo $(BUILD) directory exists
	mkdir $(BUILD)/css || echo $(BUILD)/css directory exists
	mkdir $(BUILD)/js  || echo $(BUILD)/js directory exists
	mkdir $(BUILD)/js/codemirror || echo $(BUILD)/js/codemirror directory exists

	node_modules/rollup/bin/rollup src/js/index.js --output   $(BUILD)/js/index.js
	sed -i.bak 's/export default main;/var app = main();/'    $(BUILD)/js/index.js
	rm $(BUILD)/js/index.js.bak

	cp -a lib/fonts        $(BUILD)/.
	cp src/index.html      $(BUILD)/.
	cp src/css/index.css   $(BUILD)/css/index.css

	cp lib/js/*                                                      $(BUILD)/js/.
	cp lib/css/*                                                     $(BUILD)/css/.

	cp node_modules/axios/dist/axios.js                              $(BUILD)/js/.
	cp node_modules/axios/dist/axios.min.map                         $(BUILD)/js/axios.map
	cp node_modules/bootstrap/dist/js/bootstrap.js                   $(BUILD)/js/.
	cp node_modules/d3-selection/build/d3-selection.js               $(BUILD)/js/.
	cp node_modules/handsontable/dist/numbro/numbro.js               $(BUILD)/js/.
	cp node_modules/handsontable/dist/moment/moment.js               $(BUILD)/js/.
	cp node_modules/handsontable/dist/pikaday/pikaday.js             $(BUILD)/js/.
	cp node_modules/handsontable/dist/zeroclipboard/ZeroClipboard.js $(BUILD)/js/.
	cp node_modules/handsontable/dist/handsontable.full.js           $(BUILD)/js/.
	cp node_modules/codemirror/lib/codemirror.js                     $(BUILD)/js/.
	cp node_modules/codemirror/mode/javascript/javascript.js         $(BUILD)/js/codemirror/.
	cp node_modules/codemirror/keymap/emacs.js                       $(BUILD)/js/codemirror/.
	cp node_modules/mousetrap/mousetrap.js                           $(BUILD)/js/.

	cp node_modules/bootstrap/dist/css/*                             $(BUILD)/css/.
	cp node_modules/bootstrap/dist/fonts/*                           $(BUILD)/fonts/.
	cp node_modules/handsontable/dist/pikaday/pikaday.css            $(BUILD)/css/.
	cp node_modules/handsontable/dist/handsontable.full.css          $(BUILD)/css/.
	cp node_modules/codemirror/lib/codemirror.css                    $(BUILD)/css/.
	cp node_modules/codemirror/theme/monokai.css                     $(BUILD)/css/.
	cp node_modules/codemirror/theme/solarized.css                   $(BUILD)/css/.
