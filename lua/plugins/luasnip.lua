return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local luasnip = require("luasnip")

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- LuaSnip configuration
    luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
          active = {
            virt_text = { { "●", "DiagnosticHint" } },
          },
        },
      },
    })

    -- Choice node navigation (Tab/S-Tab handled by blink.cmp)
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, { desc = "Change choice in snippet" })
  end,
}
