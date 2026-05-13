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
    "OXY2DEV/markview.nvim",
    submodules = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      markdown = {
        headings = {
          enable = true,
          heading_1 = { style = "icon", icon = "󰲡 ", hl = "MarkviewHeading1" },
          heading_2 = { style = "icon", icon = "󰲣 ", hl = "MarkviewHeading2" },
          heading_3 = { style = "icon", icon = "󰲥 ", hl = "MarkviewHeading3" },
          heading_4 = { style = "icon", icon = "󰲧 ", hl = "MarkviewHeading4" },
          heading_5 = { style = "icon", icon = "󰲩 ", hl = "MarkviewHeading5" },
          heading_6 = { style = "icon", icon = "󰲫 ", hl = "MarkviewHeading6" },
        },
        checkboxes = {
          enable = true,
          ["~"] = { text = "󰓎 ", hl = "DiagnosticWarn" },
        },
      },
    },
  },
}
