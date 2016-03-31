setl commentstring=//\ %s
setl textwidth=80
let $GTAGSLABEL='drupal7'

setl keywordprg=pman\ -P\ cat
setl suffixesadd=.inc,.module,.install,.engine,.theme

" ft-php-indent options
" let g:PHP_autoformatcomment=0
let g:PHP_vintage_case_default_indent=1

" ft-php-syntax options
let g:php_folding=1

" delimitMate options
let b:delimitMate_matchpairs="(:),[:],{:}"
