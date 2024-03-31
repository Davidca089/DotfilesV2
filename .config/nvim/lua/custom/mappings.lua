local M = {}

---- In order to disable a default keymap, use
--M.disabled = {
--  n = {
--      ["<leader>h"] = "",
--      ["<C-a>"] = ""
--  }
--}
--

M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<leader>t"] = "",
      ["<leader>n"] = "",
      ["<leader>s"] = ""
  }
}


-- Your custom mappings
M.abc = {
    v = {
        [">"] = { ">gv" },
        ["<"] = { "<gv" },
        ["J"] = { ":m'>+<CR>gv=gv" },
        ["K"] = { ":m-2<CR>gv=gv" },
        ["<leader>y"] = { "\"+y" },
    },

    n = {
        ["<leader>pv"] = { ":NvimTreeToggle <CR>" },
        ["<C-h>"] = { ":NvimTreeFocus <CR>" },
        ["<F4>"] = { ":NvimTreeToggle <CR>" },
        ["<leader>p"] = { "\"_dP" },
        ["<leader>y"] = { "\"+y" },
        ["<leader>Y"] = { "\"+Y" },
        ["<C-\\>"] = { ":LazyGit <CR>" },
    },

    i = {
        ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    },

    x = {
        ["<leader>p"] = { "\"_dP" },
    }
}

return M
