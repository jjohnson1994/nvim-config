return {
  -- Update notifier runs on startup to check for config updates
  {
    "folke/snacks.nvim",
    init = function()
      -- Load saved auto update check state or enable by default
      local persist = require("persist")
      vim.g.auto_update_check = persist.get("auto_update_check", true)
    end,
    opts = function(_, opts)
      -- Check for neovim config updates on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("CheckConfigUpdates", { clear = true }),
        callback = function()
          -- Only check if auto update check is enabled
          if not vim.g.auto_update_check then
            return
          end

          -- Only check if we're in the config directory
          local config_path = vim.fn.stdpath("config")

          -- Run git fetch in background to check for updates
          vim.system(
            { "git", "-C", config_path, "fetch", "origin", "--quiet" },
            { text = true },
            function(fetch_result)
              -- Only continue if fetch succeeded
              if fetch_result.code ~= 0 then
                return
              end

              -- Check if we're behind the remote
              vim.system(
                { "git", "-C", config_path, "rev-list", "--count", "HEAD..@{u}" },
                { text = true },
                function(result)
                  if result.code == 0 and result.stdout then
                    local commits_behind = tonumber(vim.trim(result.stdout))

                    if commits_behind and commits_behind > 0 then
                      -- Get the current branch name
                      vim.system(
                        { "git", "-C", config_path, "branch", "--show-current" },
                        { text = true },
                        function(branch_result)
                          local branch = branch_result.code == 0 and vim.trim(branch_result.stdout) or "main"

                          -- Schedule notification on main thread
                          vim.schedule(function()
                            require("snacks").notify(
                              string.format(
                                "NeoJim config update available!\n\n%d new commit%s on remote.\n\nRun :UpdateConfig to update",
                                commits_behind,
                                commits_behind > 1 and "s" or ""
                              ),
                              {
                                title = "Config Update Available",
                                level = "info",
                                timeout = 10000, -- Show for 10 seconds
                              }
                            )
                          end)
                        end
                      )
                    end
                  end
                end
              )
            end
          )

          -- Auto-update lazy plugins, mason packages, and treesitter parsers
          vim.schedule(function()
            -- Update lazy plugins (runs silently in background)
            local lazy_ok, lazy = pcall(require, "lazy")
            if lazy_ok then
              lazy.update({
                show = false, -- Don't show the UI
                wait = false, -- Don't block
              })
            end

            -- Update mason packages
            -- Note: We only refresh the registry to check for updates
            -- Automatic installation could be slow, so users should run :MasonUpdateAll
            -- or open :Mason and press 'U' to update all packages manually
            local mason_ok, mason_registry = pcall(require, "mason-registry")
            if mason_ok then
              -- Refresh registry in background (silent)
              pcall(function()
                mason_registry.refresh()
              end)
            end

            -- Update treesitter parsers silently (only notify if updates occur)
            local ts_ok = pcall(require, "nvim-treesitter.install")
            if ts_ok then
              -- Temporarily disable notifications by redirecting messages
              local old_notify = vim.notify
              local update_occurred = false

              vim.notify = function(msg, level, opts)
                -- Capture if an update actually occurred
                if msg and (msg:match("updated") or msg:match("installed")) then
                  update_occurred = true
                end
                -- Suppress the default "all parsers are up to date" message
                if not (msg and msg:match("All parsers are up%-to%-date")) then
                  -- Allow other important messages through
                  if msg and (msg:match("error") or msg:match("Error")) then
                    old_notify(msg, level, opts)
                  end
                end
              end

              -- Run the update
              vim.cmd("TSUpdate")

              -- Restore original notify
              vim.notify = old_notify
            end
          end)
        end,
      })

      -- Create :MasonUpdateAll command to update all Mason packages
      vim.api.nvim_create_user_command("MasonUpdateAll", function()
        local mason_ok, mason_registry = pcall(require, "mason-registry")
        if not mason_ok then
          require("snacks").notify("Mason is not available", {
            title = "Mason Update Failed",
            level = "error",
          })
          return
        end

        require("snacks").notify("Updating all Mason packages...", {
          title = "Mason Update",
          level = "info",
        })

        mason_registry.refresh(function()
          local installed_packages = mason_registry.get_installed_packages()
          local total = #installed_packages
          local updated = 0

          for _, pkg in ipairs(installed_packages) do
            pkg:install():once("closed", function()
              updated = updated + 1
              if updated == total then
                require("snacks").notify(
                  string.format("Updated %d Mason package%s", total, total > 1 and "s" or ""),
                  {
                    title = "Mason Update Complete",
                    level = "info",
                  }
                )
              end
            end)
          end
        end)
      end, { desc = "Update all Mason packages" })

      -- Create :UpdateConfig command to pull updates
      vim.api.nvim_create_user_command("UpdateConfig", function()
        local config_path = vim.fn.stdpath("config")

        -- Check for uncommitted changes first
        vim.system({ "git", "-C", config_path, "diff-index", "--quiet", "HEAD" }, { text = true }, function(diff_result)
          if diff_result.code ~= 0 then
            vim.schedule(function()
              require("snacks").notify(
                "You have uncommitted changes in your config.\n\nPlease commit or stash them before updating.",
                {
                  title = "Cannot Update Config",
                  level = "warn",
                }
              )
            end)
            return
          end

          -- Pull updates
          vim.system({ "git", "-C", config_path, "pull", "--rebase" }, { text = true }, function(pull_result)
            vim.schedule(function()
              if pull_result.code == 0 then
                require("snacks").notify(
                  "Config updated successfully!\n\nRestart Neovim to apply changes.",
                  {
                    title = "Config Updated",
                    level = "info",
                  }
                )
              else
                require("snacks").notify(
                  "Failed to update config.\n\n" .. (pull_result.stderr or "Unknown error"),
                  {
                    title = "Update Failed",
                    level = "error",
                  }
                )
              end
            end)
          end)
        end)
      end, { desc = "Update Neovim configuration from remote" })

      -- Toggle auto update check
      vim.keymap.set("n", "<leader>uu", function()
        local persist = require("persist")
        vim.g.auto_update_check = not vim.g.auto_update_check
        persist.set("auto_update_check", vim.g.auto_update_check)
        local status = vim.g.auto_update_check and "enabled" or "disabled"
        require("snacks").notify("Auto update check " .. status, { level = "info" })
      end, { desc = "Toggle auto update check" })

      return opts
    end,
  },
}
