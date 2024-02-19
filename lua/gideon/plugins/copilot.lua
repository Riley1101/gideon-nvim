return {
    "github/copilot.vim",
    config = function()
        vim.api.nvim_set_keymap('i', '<leader>/', 'copilot#Accept("<CR>")', {expr=true, silent=true})
    end;
}
