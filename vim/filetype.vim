" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.install setfiletype php.drupal
  au! BufRead,BufNewFile *.test setfiletype php.drupal
  au! BufRead,BufNewFile *.inc setfiletype php.drupal
  au! BufRead,BufNewFile *.module setfiletype php.drupal
augroup END
