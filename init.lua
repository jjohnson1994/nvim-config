--[[
  Local Dependencies:
  
    Packer:
      https://github.com/wbthomason/packer.nvim
      
      git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    
    Fonts:
      A patched nerd font, JetBrains Mono Nerd Font is good
    
    DAP Adapters:
      node-debug2 and vscode-chrome-debug cloned and build at ~/Projects
]]--


require "plugins"
require "general"
require "keymaps"
require "theme"
require "lsp"

require "plugin/bufferline"
require "plugin/comment"
require "plugin/dap"
require "plugin/fidget"
require "plugin/git-signs"
require "plugin/lua-line"
require "plugin/mason"
require "plugin/navic"
require "plugin/neotest"
require "plugin/nerd-commented"
require "plugin/nvim-autopairs"
require "plugin/nvim-cmp"
require "plugin/nvim-tree"
require "plugin/range-highlight"
require "plugin/refactoring"
require "plugin/telescope"
require "plugin/treesitter"
require "plugin/trouble"
require "plugin/vim-vsnip"
