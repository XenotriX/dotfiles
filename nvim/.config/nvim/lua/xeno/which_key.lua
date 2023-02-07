local wk = require("which-key")

require('which-key').setup {
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            g = false,
        },
    },
    ignore_missing = true,
}

-- Normal mode
wk.register({
    s = {
        name = "Search",
        g = "Find in files",
        r = "Resume previous search",
        s = "Symbols in file",
    },
    r = {
        name = 'Refactor',
        n = 'Rename',
        i = 'Inline variable',
        b = 'Extract block',
    },
    d = {
        name = 'Diagnostics',
        a = 'Code action',
        q = 'Send to quickfix',
        f = 'Open floating',
    },
    f = 'Format',
    e = 'Toggle file tree'
}, {prefix = '<leader>'})

wk.register({
    g = {
        name = 'Goto',
        h = 'Switch between header/file',
        d = 'Definition',
        D = 'Declaration',
        i = 'Implementation',
        r = 'References',
        t = 'Type Definition',
    }
})

-- Visual mode
wk.register({
    r = {
        f = 'Extract function',
        v = 'Extract variable',
        i = 'Inline variable',
    }
}, {prefix = '<leader>', mode = 'v'})
