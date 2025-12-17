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
          -- Markdown heading colors for better visibility
          RenderMarkdownH1 = { fg = "#ff6e67", bold = true },
          RenderMarkdownH2 = { fg = "#ffa066", bold = true },
          RenderMarkdownH3 = { fg = "#e6c384", bold = true },
          RenderMarkdownH4 = { fg = "#9ece6a", bold = true },
          RenderMarkdownH5 = { fg = "#7dcfff", bold = true },
          RenderMarkdownH6 = { fg = "#bb9af7", bold = true },
          RenderMarkdownH1Bg = { bg = "NONE" },
          RenderMarkdownH2Bg = { bg = "NONE" },
          RenderMarkdownH3Bg = { bg = "NONE" },
          RenderMarkdownH4Bg = { bg = "NONE" },
          RenderMarkdownH5Bg = { bg = "NONE" },
          RenderMarkdownH6Bg = { bg = "NONE" },
          -- Markdown inline highlight (yellow marker)
          RenderMarkdownInlineHighlight = { bg = "#ffff00", fg = "#000000", bold = true },
          -- Markdown inline highlight (red marker)
          RenderMarkdownInlineHighlightRed = { bg = "#ff6b6b", fg = "#000000", bold = true },
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
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      checkbox = {
        custom = {
          important = { raw = "[~]", rendered = "󰓎 ", highlight = "DiagnosticWarn" },
        },
      },
      inline_highlight = {
        enabled = true,
        -- Markdown highlight syntax: ==text== (yellow), ==!text== (red)
        highlight = "RenderMarkdownInlineHighlight",
        custom = {
          red = { prefix = "!", highlight = "RenderMarkdownInlineHighlightRed" },
        },
      },
      heading = {
        enabled = true,
        sign = true,
        position = "inline",
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        signs = { "󰫎 " },
        width = "full",
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = false,
        border_virtual = false,
        border_prefix = false,
        above = "▄",
        below = "▀",
        backgrounds = {},
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
      },
    },
  },
}
