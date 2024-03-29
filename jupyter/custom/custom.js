require(["codemirror/keymap/sublime", "notebook/js/cell", "base/js/namespace"],
    function(sublime_keymap, cell, IPython) {
        cell.Cell.options_default.cm_config.keyMap = 'sublime';
        cell.Cell.options_default.cm_config.extraKeys["Ctrl-Enter"] = function(cm) {}
        var cells = IPython.notebook.get_cells();
        for (var cl = 0; cl < cells.length; cl++) {
            cells[cl].code_mirror.setOption('keyMap', 'sublime');
            cells[cl].code_mirror.setOption("extraKeys", {
                "Ctrl-Enter": function(cm) {}
            });
        }
    }
);


// // from https://www.perfectlyrandom.org/2016/03/19/sublime-text-style-multiple-cursors-in-jupyter-notebook/
// require(["codemirror/keymap/sublime", "notebook/js/cell", "base/js/namespace"],
//     function(sublime_keymap, cell, IPython) {
//         cell.Cell.options_default.cm_config.keyMap = 'sublime';
//         var cells = IPython.notebook.get_cells();
//         for (var c = 0; c < cells.length; c++) {
//             cells[c].code_mirror.setOption('keyMap', 'sublime');
//         }
//     }
// );