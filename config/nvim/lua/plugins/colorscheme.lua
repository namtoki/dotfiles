return {
  -- "folke/tokyonight.nvim",
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors)
        return {
          -- Make neo-tree background transparent
          NeoTreeNormal = { bg = "NONE" },
          NeoTreeNormalNC = { bg = "NONE" },
          NeoTreeEndOfBuffer = { bg = "NONE" },
          NeoTreeVertSplit = { bg = "NONE" },
          NeoTreeWinSeparator = { bg = "NONE" },
          NeoTreeStatusLine = { bg = "NONE" },
          NeoTreeStatusLineNC = { bg = "NONE" },
          -- Markdown code block background transparent for markview.nvim
          MarkviewCode = { bg = "NONE" },
          MarkviewInlineCode = { bg = "NONE" },
          -- Markdown heading colors for markview.nvim
          MarkviewHeading1 = { fg = "#ff6e67", bold = true },
          MarkviewHeading2 = { fg = "#ffa066", bold = true },
          MarkviewHeading3 = { fg = "#e6c384", bold = true },
          MarkviewHeading4 = { fg = "#9ece6a", bold = true },
          MarkviewHeading5 = { fg = "#7dcfff", bold = true },
          MarkviewHeading6 = { fg = "#bb9af7", bold = true },
        }
      end,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = true,
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "OXY2DEV/markview.nvim",
    submodules = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("markview").setup({
        markdown_inline = {
          highlights = {
            enable = true,
            default = {
              padding_left = " ",
              padding_right = " ",
              hl = "MarkviewHighlightMagenta",
            },
          },
        },
        markdown = {
          headings = {
            enable = true,
            heading_1 = { style = "icon", icon = "󰲡 ", hl = "MarkviewHeading1" },
            heading_2 = { style = "icon", icon = "󰲣 ", hl = "MarkviewHeading2" },
            heading_3 = { style = "icon", icon = "󰲥 ", hl = "MarkviewHeading3" },
            heading_4 = { style = "icon", icon = "󰲧 ", hl = "MarkviewHeading4" },
            heading_5 = { style = "icon", icon = "󰲩 ", hl = "MarkviewHeading5" },
            heading_6 = { style = "icon", icon = "󰲫 ", hl = "MarkviewHeading6" },
            org_indent = true,
            org_indent_wrap = true,
            org_shift_char = " ",
            org_shift_width = 2,
          },
          checkboxes = {
            enable = true,
            checked = { text = "✓", hl = "MarkviewCheckboxChecked", scope_hl = "MarkviewCheckboxChecked" },
            unchecked = { text = "☐", hl = "MarkviewCheckboxUnchecked", scope_hl = "MarkviewCheckboxUnchecked" },
            ["~"] = { text = "󰓎", hl = "DiagnosticWarn" },
          },
          list_items = {
            enable = true,
            indent_size = 2,
            shift_width = 0,
            marker_minus = {
              add_padding = false,
              conceal_on_checkboxes = true,
              text = "●",
              hl = "MarkviewListItemMinus",
            },
            marker_plus = {
              add_padding = false,
              conceal_on_checkboxes = true,
              text = "◈",
              hl = "MarkviewListItemPlus",
            },
            marker_star = {
              add_padding = false,
              conceal_on_checkboxes = true,
              text = "◇",
              hl = "MarkviewListItemStar",
            },
          },
        },
      })

      -- markview regenerates MarkviewCode on VimEnter/ColorScheme events,
      -- overriding kanagawa's overrides. Register our autocmd after markview's
      -- so it fires last and wins.
      local function fix_code_hl()
        vim.api.nvim_set_hl(0, "MarkviewCode", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "MarkviewInlineCode", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "MarkviewHighlightMagenta", { fg = "#FF00FF", bg = "NONE" })
      end
      fix_code_hl()
      vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        callback = fix_code_hl,
      })
    end,
  },
}
