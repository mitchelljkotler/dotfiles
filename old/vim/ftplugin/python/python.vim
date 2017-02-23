set ts=4
set sw=4
set sta
set et
set sts=4
filetype indent on
"set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"this makes it so # doesn't reset the indenting
"inoremap # a#<Left><BS><Right>
"hi pythonComment ctermfg=green

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

"set tags+=~/.vim/tags/python.ctags
set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>
"noremap <f8> :TlistToggle<cr>
