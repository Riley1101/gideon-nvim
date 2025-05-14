return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local tits = require('nvim-treesitter.configs');
    tits.setup({
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end;
}
