local v_rolling = false
local timer = vim.loop.new_timer()

local function roll(direction, delay)
  v_rolling = true
  timer:start(
    0,
    delay or 30,
    vim.schedule_wrap(function()
      if v_rolling == false then
        timer:stop()
      end
      vim.api.nvim_command("normal! " .. direction)
    end)
  )
end

vim.keymap.set("n", "e", function()
  v_rolling = false
end)

vim.keymap.set("n", "vvk", function()
  roll("k")
end)

vim.keymap.set("n", "vvj", function()
  roll("j")
end)

vim.keymap.set("n", "vvl", function()
  roll("l", 10)
end)

vim.keymap.set("n", "vvh", function()
  roll("h", 10)
end)
