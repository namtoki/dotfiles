return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional: nicer UI
    },
    config = function()
      require("flutter-tools").setup{
        flutter_path = "flutter", -- if not in PATH, provide full path
        widget_guides = { enabled = true },
        closing_tags = { highlight = "Comment" },
        lsp = {
          color = {
            enabled = true,
            background = true,
            virtual_text = true,
          },
        },
      }
    end,
  },
}
