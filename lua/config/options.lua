vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.cursorline = false

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#222222", bg = "none" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#000000", bg = "none" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#000000", bg = "none" })

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = { border = "none" },
})
