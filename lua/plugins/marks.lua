return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    signs = true,
    builtin_marks = { ".", "<", ">", "^" },
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    bookmark_0 = {
      sign = "⚑",
      virt_text = "hello world",
    },
  },
}
