return {
  {
    "karb94/neoscroll.nvim",
    enabled = false,
  },

  {
    "folke/snacks.nvim",
    opts = {
      animate = { enabled = false },
      scroll = { enabled = false },
      indent = { enabled = false },
      dashboard = { enabled = true },
    },
    picker = {
      explorer = {
        hidden = true,
        ignored = true,
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static",
      timeout = 2000,
      render = "minimal",
    },
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
      draw = {
        delay = 0,
        animation = function()
          return 0
        end,
      },
    },
  },
}
