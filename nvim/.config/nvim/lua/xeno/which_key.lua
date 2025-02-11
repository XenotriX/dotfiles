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
        S = "Symbols in workspace",
        f = "Functions in file",
        F = "Functions in workspace",
    },
    r = {
        name = 'Refactor',
        n = 'Rename',
        i = 'Inline variable',
        b = 'Extract block',
        a = 'Swap args (right)',
        A = 'Swap args (left)',
    },
    d = {
        name = 'Diagnostics',
        a = 'Code action',
        q = 'Send to quickfix',
        f = 'Open floating',
    },
    p = {
        name = 'Peek',
        f = 'Function',
        c = 'Class',
    },
    f = 'Format',
    e = 'Toggle file tree',
    m = 'Make',
    z = 'Zen Mode',
    w = {
        name = 'Wiki (Obsidian)',
        n = 'New note',
        o = 'Open note',
        f = 'Search notes',
        v = {
            name = 'View',
            b = 'View backlinks',
            l = 'View links',
            x = 'View in Obsidian',
            t = 'View tags',
            d = 'View daily notes',
        },
        e = {
            name = 'Edit',
            i = 'Insert image',
            l = 'Insert link',
            x = 'Extract note',
            r = 'Rename note',
            n = 'Insert link (Create)'
        }
    },
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
