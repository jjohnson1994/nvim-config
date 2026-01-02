-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
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

-- Terminal title - set to project name
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')} - nvim"

-- Function to get project root and update title
local function update_title()
  -- Try to find .git directory
  local git_dir = vim.fn.finddir(".git", ".;")
  if git_dir ~= "" then
    -- :p adds trailing slash for dirs, so :h:h gets parent of .git
    local project_name = vim.fn.fnamemodify(git_dir, ":p:h:h:t")
    vim.opt.titlestring = project_name .. " - nvim"
    return
  end

  -- Try to find package.json
  local package_json = vim.fn.findfile("package.json", ".;")
  if package_json ~= "" then
    local project_name = vim.fn.fnamemodify(package_json, ":p:h:t")
    vim.opt.titlestring = project_name .. " - nvim"
    return
  end

  -- Fall back to current directory name
  local cwd = vim.fn.getcwd()
  local dir_name = vim.fn.fnamemodify(cwd, ":t")
  vim.opt.titlestring = dir_name .. " - nvim"
end

-- Set title on startup and when directory changes
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = update_title,
})

-- Completion settings
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
  virtual_text = false,
  virtual_lines = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

-- Persist module for toggle state
local persist = require("persist")

-- Load and apply wrap setting
vim.g.wrap_enabled = persist.get("wrap_enabled", false)
if vim.g.wrap_enabled then
  vim.opt.wrap = true
end

-- Toggle diagnostic display mode (virtual_lines vs virtual_text vs minimal)

-- Load saved diagnostic mode or use default
vim.g.diagnostic_mode = persist.get("diagnostic_mode", "virtual_lines")

-- Apply saved diagnostic mode on startup
if vim.g.diagnostic_mode == "virtual_text" then
  vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
  })
elseif vim.g.diagnostic_mode == "minimal" then
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
  })
else
  -- Already configured above with virtual_lines = true
end

local function toggle_diagnostic_mode()
  if vim.g.diagnostic_mode == "virtual_lines" then
    vim.g.diagnostic_mode = "virtual_text"
    vim.diagnostic.config({
      virtual_text = true,
      virtual_lines = false,
    })
    persist.set("diagnostic_mode", "virtual_text")
    vim.notify("Diagnostics: virtual text", vim.log.levels.INFO)
  elseif vim.g.diagnostic_mode == "virtual_text" then
    vim.g.diagnostic_mode = "minimal"
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
    })
    persist.set("diagnostic_mode", "minimal")
    vim.notify("Diagnostics: minimal (underline only)", vim.log.levels.INFO)
  else
    vim.g.diagnostic_mode = "virtual_lines"
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = true,
    })
    persist.set("diagnostic_mode", "virtual_lines")
    vim.notify("Diagnostics: virtual lines", vim.log.levels.INFO)
  end
end

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

-- Horizontal scrolling (can hold to keep scrolling)
keymap("n", "<M-h>", "3zh", { desc = "Scroll right" })
keymap("n", "<M-l>", "3zl", { desc = "Scroll left" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

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

-- Toggle diagnostic display mode
keymap("n", "<leader>ud", toggle_diagnostic_mode, { desc = "Toggle diagnostic display mode" })

-- Toggle line wrapping
local function toggle_wrap()
  vim.opt.wrap = not vim.opt.wrap:get()
  vim.g.wrap_enabled = vim.opt.wrap:get()
  persist.set("wrap_enabled", vim.g.wrap_enabled)
  local status = vim.g.wrap_enabled and "enabled" or "disabled"
  vim.notify("Line wrap " .. status, vim.log.levels.INFO)
end

keymap("n", "<leader>uw", toggle_wrap, { desc = "Toggle line wrap" })

-- Statusline with LSP diagnostics (see README.md "Status Bar" section for full documentation)
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

-- Configure statusline (see README.md "Status Bar" section for format details)
vim.opt.statusline = "%<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V %) %P"

-- Note: LSP servers are enabled in lua/plugins/lsp-config.lua after configuration
