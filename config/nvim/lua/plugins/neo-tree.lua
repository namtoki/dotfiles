return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        hijack_netrw_behavior = "open_current",
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            -- Set transparent background for neo-tree
            vim.cmd("highlight NeoTreeNormal guibg=NONE")
            vim.cmd("highlight NeoTreeNormalNC guibg=NONE")
            vim.cmd("highlight NeoTreeEndOfBuffer guibg=NONE")
            vim.cmd("highlight NeoTreeVertSplit guibg=NONE")
            vim.cmd("highlight NeoTreeWinSeparator guibg=NONE")
            vim.cmd("highlight NeoTreeStatusLine guibg=NONE")
            vim.cmd("highlight NeoTreeStatusLineNC guibg=NONE")
          end,
        },
      },
    },
  },
}