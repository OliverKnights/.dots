local api = vim.api

-- lists of regexes that can be incremented by increment_list_state
local lists = {
  {"TODO", "DOING", "DONE"},
  {"%[ %]", "%[o%]", "%[x%]"}
}

-- Increments one of the lists defined above by the given delta, (-1 to move backwards)
function increment_list_state(delta)
  line = api.nvim_get_current_line()
  for i, list in ipairs(lists) do
    for j, v in ipairs(list) do
      if line:match(v) then
        replaced = line:gsub(v, list[((j-1+delta) % #list) + 1], 1)
        api.nvim_set_current_line(replaced)
        return
      end
    end
  end
end

function auto_list()
  line_num = vim.fn.line('.')
  prev_line = api.nvim_buf_get_lines(0, line_num - 2, line_num - 1, false)
  -- match a 1 or more digits followed by . then one whitespace and another char
  if prev_line[1]:match("%d+%.%s.") then
    digit = prev_line[1]:match("%d+")
    api.nvim_buf_set_lines(0, line_num - 1, line_num, false, {
      string.format("%d. ", tonumber(digit) + 1)
    })
  elseif prev_line[1]:match("-%s%[%s]%s.") then
    api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { "- [ ] " })
  elseif prev_line[1]:match("-%s.") then
    api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { "- " })
  end
end

return {
  auto_list = auto_list;
  increment_list_state = increment_list_state;
}
