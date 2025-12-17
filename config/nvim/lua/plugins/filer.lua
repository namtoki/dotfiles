return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("projects")
      end)
    end,
    keys = {
      {
        "<leader>p",
        function()
          require("telescope").extensions.projects.projects({})
        end,
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader><Space>",
        function()
          require("telescope.builtin").find_files({
            no_ignore = false,
            hidden = false,
            cwd = vim.fn.getcwd(),
          })
        end,
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd() })
        end,
      },
      -- {
      --   "<leader>d",
      --   function()
      --     require("telescope.builtin").diagnostics()
      --   end,
      --   desc = "Lists Diagnostics for all open buffers or a specific buffer",
      -- },
      {
        "<leader>s",
        function()
          require("telescope.builtin").treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top", width = 0.95 },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
        file_ignore_patterns = {
          "ls_main/*",
          "m_amp_main",
          "sub_fy23_cy23_24/*",
          "sys_main/*",
          "vc_project/*",
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("projects")
    end,
  },
  {
    "kazhala/close-buffers.nvim",
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<C-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<C-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Prev buffer" },
      { "<S-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Next buffer" },
    },
    opts = {
      options = {
        separator_style = "thin",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
}
