fu! notes#Yesterday()
  exec 'e ~/Projects/notes/' . trim(system('date -d "-1 days" +%Y-%m-%d')) . '.md'
endfu

fu! notes#Tomorrow()
  exec 'e ~/Projects/notes/' . trim(system('date -d "+1 days" +%Y-%m-%d')) . '.md'
endfu

fu! notes#Today()
  exec 'e ~/Projects/notes/' . trim(system('date +%Y-%m-%d')) . '.md'
endfu
