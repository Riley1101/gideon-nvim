return {
    'sbdchd/neoformat',
    config = function ()
        vim.keymap.set("n","<leader>fn", "<cmd>Neoformat<cr>")
    end;
}
