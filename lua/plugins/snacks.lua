return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Notification manager (replaces nvim-notify)
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true,
      sort = { "level", "added" },
      level = vim.log.levels.TRACE,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
      },
      style = "compact",
    },

    -- Smooth scrolling (replaces neoscroll.nvim)
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 250 },
        easing = "linear",
      },
      spamming = 10,
      -- Smooth scroll for these keys
      -- Note: <C-d> and <C-u> are handled in options.lua with zz centering
      filter = function(buf, key)
        return vim.bo[buf].buftype ~= "terminal"
      end,
    },

    -- Dashboard (startup screen)
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗      ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗     ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║     ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║██   ██║██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝╚█████╔╝██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚════╝ ╚═╝╚═╝     ╚═╝
]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },

    -- Better terminal
    terminal = {
      enabled = true,
      win = {
        position = "bottom",
        height = 0.4,
      },
    },

    -- Indent guides
    indent = {
      enabled = false, -- Disabled since we use mini.indentscope
    },

    -- Quickfile
    quickfile = { enabled = true },

    -- Statuscolumn
    statuscolumn = { enabled = false },

    -- Words (reference highlighting - disabled since we use vim-illuminate)
    words = { enabled = false },

    -- Styles for different UI elements
    styles = {
      notification = {
        wo = { wrap = true },
        border = "rounded",
      },
    },
  },

  keys = {
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss all notifications" },
    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification history" },
    { "<c-/>", function() Snacks.terminal() end, desc = "Toggle terminal", mode = { "n", "t" } },
    { "<c-_>", function() Snacks.terminal() end, desc = "Toggle terminal (alternative)", mode = { "n", "t" } },
  },

  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup notification as default vim.notify
        vim.notify = Snacks.notifier.notify

        -- Create some useful commands
        vim.api.nvim_create_user_command("NotifyHistory", function()
          Snacks.notifier.show_history()
        end, { desc = "Show notification history" })
      end,
    })
  end,
}
