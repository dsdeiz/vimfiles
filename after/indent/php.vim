setlocal formatoptions=qrocb
" HTML is being run for some unknown reason and I don't know why. It sets
" 'comments' option in $VIMRUNTIME/ftplugin/php.vim. Reset it here.
setlocal comments=s1:/*,mb:*,ex:*/,://,:#
