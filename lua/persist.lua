-- Persistence module for saving toggle states across sessions
local M = {}

-- Path to persistence file
local state_file = vim.fn.stdpath("data") .. "/neojim_state.json"

-- Load state from file
local function load_state()
  local file = io.open(state_file, "r")
  if not file then
    return {}
  end

  local content = file:read("*all")
  file:close()

  local ok, state = pcall(vim.fn.json_decode, content)
  if not ok then
    return {}
  end

  return state or {}
end

-- Save state to file
local function save_state(state)
  local file = io.open(state_file, "w")
  if not file then
    vim.notify("Failed to save state", vim.log.levels.ERROR)
    return
  end

  local content = vim.fn.json_encode(state)
  file:write(content)
  file:close()
end

-- Current state cache
local state = load_state()

-- Get a value from state
function M.get(key, default)
  if state[key] == nil then
    return default
  end
  return state[key]
end

-- Set a value in state and persist it
function M.set(key, value)
  state[key] = value
  save_state(state)
end

return M
