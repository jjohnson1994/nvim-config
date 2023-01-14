require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'html',
    'javascript',
    'typescript',
    'json',
    'dockerfile',
    'css',
    'jsdoc',
    'scss',
    'tsx',
    'vim',
    'vue',
    'yaml',
    'lua',
    'graphql',
    'hcl',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

