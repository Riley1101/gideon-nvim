return {
  'ThePrimeagen/harpoon',
  config = function()
    require("harpoon").setup({
      menu = {
        width = 60,
        height = 10,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      },
    })

    local ok, cp = pcall(require, 'catppuccin.palettes')
    if ok then
      local p = cp.get_palette('mocha')
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, 'HarpoonWindow', { bg = p.base, fg = p.text })
      set_hl(0, 'HarpoonBorder', { bg = p.base, fg = p.mauve })
    end

    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n","<leader>a",mark.add_file)
    vim.keymap.set("n","<leader>e",ui.toggle_quick_menu)
    vim.keymap.set("n","<leader>1",function()ui.nav_file(1) end)
    vim.keymap.set("n","<leader>2",function()ui.nav_file(2) end)
    vim.keymap.set("n","<leader>3",function()ui.nav_file(3) end)
    vim.keymap.set("n","<leader>4",function()ui.nav_file(4) end)
    vim.keymap.set("n","<leader>5",function()ui.nav_file(5) end)
    vim.keymap.set("n","<leader>6",function()ui.nav_file(6) end)

  end;
}

