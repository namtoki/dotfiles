return {
  {
    "LuxVim/nvim-luxmotion",
    event = "VeryLazy",
    opts = {
      cursor = {
        duration = 200,
        easing = "ease-out",
        enabled = true,
      },
      scroll = {
        duration = 300,
        easing = "ease-out",
        enabled = true,
      },
      keymaps = {
        cursor = true,
        scroll = true,
      },
    },
  },
}
