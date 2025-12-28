-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "auto:2" -- Allow up to 2 sign columns for marks + diagnostics/git
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.undofile = true

-- Completion settings (blink.cmp only, disable built-in completion)
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c") -- Don't show completion messages

-- LSP folding with native API (Neovim 0.11+)
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Inlay hints (optional - enable if desired)
-- vim.lsp.inlay_hint.enable(true)

-- Diagnostic configuration with sign icons (Neovim 0.11+ API)
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

-- Core keymaps
local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize with arrows (Alt + arrows to avoid macOS desktop switching)
keymap("n", "<M-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<M-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<M-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<M-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Keep cursor centered when jumping
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Better paste
keymap("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
keymap({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- System clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Quick save and quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>W", ":wa<CR>", { desc = "Save all files" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- Clear search highlighting
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Select all
keymap("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Buffer management
keymap("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
keymap("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Statusline with LSP diagnostics
_G.statusline_diagnostics = function()
  local counts = vim.diagnostic.count(0)
  local parts = {}

  if counts[vim.diagnostic.severity.ERROR] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.ERROR])
  end
  if counts[vim.diagnostic.severity.WARN] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.WARN])
  end
  if counts[vim.diagnostic.severity.INFO] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.INFO])
  end
  if counts[vim.diagnostic.severity.HINT] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.HINT])
  end

  return #parts > 0 and " " .. table.concat(parts, " ") .. " " or ""
end

-- Set statusline
vim.opt.statusline = "%<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%(%l,%c%V %) %P"

-- Note: LSP servers are enabled in lua/plugins/lsp-config.lua after configuration
