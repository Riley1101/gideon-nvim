return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = ' 🔍 ',
        selection_caret = ' ',
        layout_config = {
          horizontal = { prompt_position = 'top', preview_width = 0.55 },
        },
        sorting_strategy = 'ascending',
        winblend = 0,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      },
    })

    local ok, cp = pcall(require, 'catppuccin.palettes')
    if ok then
      local p = cp.get_palette('mocha')
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, 'TelescopeNormal', { bg = p.base, fg = p.text })
      set_hl(0, 'TelescopeBorder', { bg = p.base, fg = p.base })
      set_hl(0, 'TelescopePromptNormal', { bg = p.surface0 })
      set_hl(0, 'TelescopePromptBorder', { bg = p.surface0, fg = p.surface0 })
      set_hl(0, 'TelescopePromptTitle', { bg = p.mauve, fg = p.base })
      set_hl(0, 'TelescopeResultsTitle', { bg = p.base, fg = p.base })
      set_hl(0, 'TelescopePreviewTitle', { bg = p.base, fg = p.base })
      set_hl(0, 'TelescopeSelection', { bg = p.surface0, fg = p.text })
      set_hl(0, 'TelescopePreviewBorder', { bg = p.base, fg = p.mauve })
    end

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
    vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Telescope git status (uncommitted)' })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end;
}
