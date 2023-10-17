local M = {}

M.new_note = function()
  vim.ui.input({ prompt = "Note name" }, function(input)
    -- check if input is empty or nil
    if not input or input == "" then
      -- TODO: show error notification
      return
    end

    vim.cmd(":ObsidianNew " .. input)
  end)
end

return M
