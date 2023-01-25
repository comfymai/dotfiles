local hop = require("hop")
local hint = require("hop.hint")

local before = hint.HintDirection.BEFORE_CURSOR
local after = hint.HintDirection.AFTER_CURSOR

hop.setup {
    case_insensitive = false
}

local function set_keymap(motion, action, normal_only)
    normal_only = normal_only or false

    -- Some hops throw errors when done from a certain position such as an empty line
    -- pcall() catches and ignores them
    vim.keymap.set("n", motion, function() pcall(action) end)
    if not normal_only then
        vim.keymap.set("v", motion, function() pcall(action) end)
    end
end

set_keymap("f", function()
    hop.hint_char1({
        direction = after
    })
end)

set_keymap("F", function()
    hop.hint_char1({
        direction = after
    })
end)

set_keymap("t", function()
    hop.hint_char1({
        direction = after,
        hint_offset = 1
    })
end)

set_keymap("T", function()
    hop.hint_char1({
        direction = before,
    })
end)

-- Hints words after cursor
set_keymap("<leader><leader>w", function()
    hop.hint_words({
        direction = after,
    })
end)

-- Hints words before cursor
set_keymap("<leader><leader>b", function()
    hop.hint_words({
        direction = before,
    })
end)

-- Hints words on the current line
set_keymap("<leader><leader>h", function()
    hop.hint_words({
        current_line_only = true
    })
end)

-- Hints words anywhere on the current buffer
set_keymap("<leader><leader>a", function()
    hop.hint_words()
end)

-- Hints words anywhere on any open buffer
set_keymap("<leader><leader>i", function()
    hop.hint_words({
        multi_windows = true
    })
end)

-- Hints a pair of characters
set_keymap("<leader><leader>cc", function()
    hop.hint_char2()
end)

set_keymap("<leader><leader>cb", function()
    hop.hint_char2({
        direction = before,
    })
end)

set_keymap("<leader><leader>cw", function()
    hop.hint_char2({
        direction = after
    })
end)

set_keymap("<leader><leader>ci", function()
    hop.hint_char2({
        multi_windows = true
    })
end)

-- Hints all lines at the current column
set_keymap("<leader><leader>vv", function()
    hop.hint_vertical()
end)

set_keymap("<leader><leader>vw", function()
    hop.hint_vertical({
        direction = after
    })
end)

set_keymap("<leader><leader>vb", function()
    hop.hint_vertical({
        direction = before,
        hint_offset = -1
    })
end)

set_keymap("<leader><leader>vi", function()
    hop.hint_vertical({
        multi_windows = true
    })
end)

-- Hints given pattern
set_keymap("<leader><leader>p", function()
    hop.hint_patterns()
end)
