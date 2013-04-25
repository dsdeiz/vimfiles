" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.install setfiletype php
  au! BufRead,BufNewFile *.test setfiletype php
augroup END
