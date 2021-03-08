local api = vim.api

function valid_links()
  files = api.nvim_call_function('systemlist', { 'ls' })
  winnr = api.nvim_call_function('winnr', {})

  -- get this windows matches
  this_win_matches = api.nvim_call_function('getmatches', { winnr })
  -- print(dump(this_win_matches))

  -- check if this is a markdown buffer
  ft = api.nvim_buf_get_option(0, 'filetype')
  -- if not, remove all the matches and return
  if ft ~= 'markdown' then
    api.nvim_call_function('clearmatches', {})
    return
  end

  matchstring = '\\c' -- ignore case
  for i, line in ipairs(files) do
    -- \\ in lua string inserts \
    -- \< matches start of word
    -- \> matches end of word
    matchstring = matchstring .. "\\<" .. line:gsub(".md", "") .. "\\>"
    if i < #files then
      matchstring = matchstring .. "\\|"
    end
  end

  -- add a new match
  api.nvim_call_function('matchadd', { 'ValidLink', matchstring })
end

return {
  valid_links = valid_links;
}
