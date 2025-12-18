return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local colors = {
        bg = "#1a1b26",
        fg = "#c0caf5",
        yellow = "#e0af68",
        cyan = "#7dcfff",
        green = "#9ece6a",
        orange = "#ff9e64",
        magenta = "#bb9af7",
        blue = "#7aa2f7",
        red = "#f7768e",
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
      }

      local config = {
        options = {
          component_separators = "",
          section_separators = { left = "", right = "" },
          theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Left side
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Right side
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      -- Left edge bar
      ins_left({
        function()
          return "▊"
        end,
        color = { fg = colors.blue },
        padding = { left = 0, right = 1 },
      })

      -- Mode indicator
      ins_left({
        function()
          local mode_icons = {
            n = " ",
            i = " ",
            v = "󰈈 ",
            V = "󰈈 ",
            [""] = "󰈈 ",
            c = " ",
            R = "󰛔 ",
            t = " ",
          }
          return mode_icons[vim.fn.mode()] or ""
        end,
        color = function()
          local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.magenta,
            V = colors.magenta,
            [""] = colors.magenta,
            c = colors.orange,
            R = colors.red,
            t = colors.cyan,
          }
          return { fg = mode_color[vim.fn.mode()] or colors.blue, gui = "bold" }
        end,
        padding = { right = 1 },
      })

      -- File icon + name
      ins_left({
        "filetype",
        icon_only = true,
        padding = { left = 1, right = 0 },
      })
      ins_left({
        "filename",
        path = 1, -- 0: filename only, 1: relative path, 2: absolute path
        cond = conditions.buffer_not_empty,
        color = { fg = colors.cyan, gui = "bold" },
        symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
      })

      -- Git diff
      ins_left({
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      })

      -- Diagnostics
      ins_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.cyan },
          hint = { fg = colors.blue },
        },
      })

      -- Middle separator
      ins_left({
        function()
          return "%="
        end,
      })

      -- LSP status
      ins_left({
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if next(clients) == nil then
            return ""
          end
          local names = {}
          for _, client in ipairs(clients) do
            table.insert(names, client.name)
          end
          return " " .. table.concat(names, ", ")
        end,
        color = { fg = colors.fg, gui = "italic" },
        cond = conditions.hide_in_width,
      })

      -- Right side
      -- File encoding
      ins_right({
        "encoding",
        fmt = string.upper,
        color = { fg = colors.green },
        cond = conditions.hide_in_width,
      })

      -- File format
      ins_right({
        "fileformat",
        fmt = string.upper,
        icons_enabled = true,
        color = { fg = colors.green },
        cond = conditions.hide_in_width,
      })

      -- Location
      ins_right({
        "location",
        color = { fg = colors.yellow },
      })

      -- Progress
      ins_right({
        "progress",
        color = { fg = colors.orange, gui = "bold" },
      })

      -- Right edge bar
      ins_right({
        function()
          return "▊"
        end,
        color = { fg = colors.blue },
        padding = { left = 1 },
      })

      return config
    end,
  },
}
