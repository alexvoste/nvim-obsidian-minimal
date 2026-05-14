local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_cursor_vfx_mode = "railgun"
  keymap.set("i", "<C-v>", "<C-r>+", opts)
end

local function smart_save()
  local ft = vim.bo.filetype
  if ft == "c" or ft == "cpp" or ft == "h" then
    if vim.fn.executable("clang-format") == 1 then
      local view = vim.fn.winsaveview()
      vim.cmd("%!clang-format")
      vim.fn.winrestview(view)
    end
  end
  vim.cmd("w")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end

keymap.set({ "n", "i", "v" }, "<C-s>", smart_save, opts)
keymap.set({ "n", "i", "v" }, "<C-w>", "<cmd>bd<cr>", opts)
keymap.set({ "n", "i", "v" }, "<C-x>", "<cmd>qa!<cr>", opts)

keymap.set("n", "<C-z>", "u", opts)
keymap.set("i", "<C-z>", "<C-o>u", opts)
keymap.set("v", "<C-z>", "<esc>u", opts)

keymap.set("n", "<C-y>", "<C-r>", opts)
keymap.set("i", "<C-y>", "<C-o><C-r>", opts)

keymap.set({ "n", "i", "v" }, "<C-a>", "ggVG", opts)

keymap.set("v", "<C-c>", '"+y', opts)
keymap.set({ "n", "v" }, "<C-v>", '"+P', opts)
keymap.set("i", "<C-v>", "<C-r>+", opts)

keymap.set("n", "<Tab>", "<cmd>bnext<cr>", opts)
keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", opts)
keymap.set("n", "<C-Left>", "<C-w>h", opts)
keymap.set("n", "<C-Down>", "<C-w>j", opts)
keymap.set("n", "<C-Up>", "<C-w>k", opts)
keymap.set("n", "<C-Right>", "<C-w>l", opts)

keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
keymap.set("v", "<Tab>", ">gv", opts)
keymap.set("v", "<S-Tab>", "<gv", opts)

keymap.set({ "n", "v" }, "<S-Up>", "<C-b>zz", opts)
keymap.set({ "n", "v" }, "<S-Down>", "<C-f>zz", opts)
keymap.set("n", "<C-A-Up>", "<cmd>resize +2<cr>", opts)
keymap.set("n", "<C-A-Down>", "<cmd>resize -2<cr>", opts)
keymap.set("n", "<C-A-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap.set("n", "<C-A-Right>", "<cmd>vertical resize +2<cr>", opts)

local function insert_copyright()
  local ft = vim.bo.filetype
  local copyright = {
    "  Copyright (C) 2026  Alex Voste",
    "  VANGUARD OS - High Assurance Security Kernel",
    "  All rights reserved. Unauthorized access is a violation of protocol.",
  }
  local header = {}
  if ft == "c" or ft == "cpp" or ft == "h" then
    table.insert(header, "/*")
    for _, l in ipairs(copyright) do
      table.insert(header, " *" .. l)
    end
    table.insert(header, " */")
  elseif ft == "lua" then
    table.insert(header, "--[[")
    for _, l in ipairs(copyright) do
      table.insert(header, "--" .. l)
    end
    table.insert(header, "]]")
  else
    table.insert(header, "#")
    for _, l in ipairs(copyright) do
      table.insert(header, "#" .. l)
    end
  end
  table.insert(header, "")
  vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
end
keymap.set("n", "<leader>C", insert_copyright, opts)

print("VANGOS CORE: Loaded & Stabilized for Neovide. ⚡️")
