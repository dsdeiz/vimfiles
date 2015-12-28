" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Drupal files.
  au! BufRead,BufNewFile *.install setfiletype php.drupal
  au! BufRead,BufNewFile *.test setfiletype php.drupal
  au! BufRead,BufNewFile *.inc setfiletype php.drupal
  au! BufRead,BufNewFile *.module setfiletype php.drupal
  au! BufRead,BufNewFile *.profile setfiletype php.drupal

  " EJS and Swig files.
  au! BufRead,BufNewFile *.ejs setfiletype html
  au! BufRead,BufNewFile *.swig setfiletype html
augroup END
