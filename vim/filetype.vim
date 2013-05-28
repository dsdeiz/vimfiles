" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.install setfiletype drupal.php
  au! BufRead,BufNewFile *.test setfiletype drupal.php
  au! BufRead,BufNewFile *.inc setfiletype drupal.php
  au! BufRead,BufNewFile *.module setfiletype drupal.php
augroup END
