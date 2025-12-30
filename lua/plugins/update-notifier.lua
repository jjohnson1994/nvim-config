return {
  -- Update notifier runs on startup to check for config updates
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- Check for neovim config updates on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("CheckConfigUpdates", { clear = true }),
        callback = function()
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
        end,
      })

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

      return opts
    end,
  },
}
