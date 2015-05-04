setlocal spell	" Enable spell-checking
setlocal wrap linebreak nolist  " Enable visual line wrapping
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

setlocal wildignore+=*.aux,*.synctex.gz,*.fdb_latexmk,*.fls,*.log,*.bbl,*.bcf,*.blg,*.run.xml
setlocal wildignore+=*.pdf,*.svg

nnoremap <buffer> <leader>ll :up!<bar>!make<cr>
nnoremap <buffer> <leader>lc :up!<bar>!make clean<cr>
