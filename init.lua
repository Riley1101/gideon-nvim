require("lazi") 
require("core")

-- =====================================================================
-- Neovim Theme Stage Show (Command Triggered Version)
-- =====================================================================

local timer = nil
local current_index = 1
local interval_ms = 300 -- Delay between changes in milliseconds

-- Command to START the show
vim.api.nvim_create_user_command("RockAndRolls", function()
  -- Check if it's already running to prevent duplicate timers
  if timer and timer:is_active() then
    vim.notify("The stage show is already running!", vim.log.levels.WARN)
    return
  end

  -- Grab ALL available themes right when the command is called
  local themes = vim.fn.getcompletion('', 'color')
  
  if #themes == 0 then
    vim.notify("No themes found to cycle through!", vim.log.levels.ERROR)
    return
  end

  local function next_theme()
    local theme = themes[current_index]
    
    -- Try to load the theme safely
    local success, _ = pcall(vim.cmd.colorscheme, theme)
    if not success then
      vim.notify("Could not load theme: " .. theme, vim.log.levels.WARN)
    end

    -- Increment index and loop back if at the end
    current_index = current_index + 1
    if current_index > #themes then
      current_index = 1
    end
  end

  -- Create and start the timer
  -- Note: Use vim.loop.new_timer() if on Neovim < 0.10
  timer = vim.uv.new_timer() 
  timer:start(0, interval_ms, vim.schedule_wrap(function()
    next_theme()
  end))

  print("Stage show started! Type :StopStageShow to end it.")
end, {})

-- Command to STOP the show
vim.api.nvim_create_user_command("StopStageShow", function()
  if timer and timer:is_active() then
    timer:stop()
    timer:close()
    timer = nil -- Clear the timer reference
    print("Stage show stopped! The curtain falls.")
  else
    print("No stage show is currently running.")
  end
end, {})
