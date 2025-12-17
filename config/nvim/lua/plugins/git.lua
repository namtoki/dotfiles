return {
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<leader>b", "<cmd>BlameToggle<cr>", desc = "toggle Blame" },
    },
    config = function(_, opts)
      require("blame").setup(opts)
    end,
  },
}
