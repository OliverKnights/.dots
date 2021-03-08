local api = vim.api

-- TODO currently only works on selected text
function tmux_send(args, first, last)
  lines = api.nvim_buf_get_lines(0, first-1, last, 0)
  for i, line in ipairs(lines) do
    cmd = "silent !tmux send-keys -t " .. args .. " '" .. trim(line) .. "' " .. "'Enter'"
    print(cmd)
    api.nvim_command(cmd)
  end
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function trim(s)
  s = string.gsub(s, "^%s*(.-)%s*$", "%1")
  return s
end

-- Improved gf
function open_file()
end

function shell_history(findstart, base)

end

return {
  tmux_send = tmux_send;
  increment_list_state = increment_list_state;
}
