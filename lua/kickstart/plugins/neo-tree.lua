-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    {
      '\\',
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd 'Neotree close'
        else
          -- Check if Neo-tree is already open
          local neo_tree_windows = vim.tbl_filter(function(win)
            local bufnr = vim.api.nvim_win_get_buf(win)
            return vim.bo[bufnr].filetype == 'neo-tree'
          end, vim.api.nvim_list_wins())

          if #neo_tree_windows > 0 then
            vim.cmd 'Neotree close'
          else
            vim.cmd 'Neotree reveal'
          end
        end
      end,
      desc = 'NeoTree toggle',
      silent = true,
    },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
