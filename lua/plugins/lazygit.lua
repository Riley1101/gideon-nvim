return {
    "kdheepak/lazygit.nvim",
    config = function()
       vim.keymap.set("n","<leader>gs",vim.cmd.LazyGit); 
    end;
}

