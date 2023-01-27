" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parens in different colors, to make
" it visually obvious what matches which.

" Obviously, most useful when working with lisp. But it's also nice othe
" times.

" I don't intend to maintain this script. I hacked it together for my
" own purposes, and it is sufficient to the day. If you want to improve it,
" knock yourself out.

" This file is public domain.


" define colors. Note that the one numbered '16' is the outermost pair,
" keep that in mind if you want to change the colors.
" Also, if this script doesn't work on your terminal, you may need to add
" guifg=xx or ever termfg=, though what good this script will do on a 
" black and white terminal I don't know.
highlight level1c guifg=brown
highlight level2c guifg=Darkblue
highlight level3c guifg=darkgray
highlight level4c guifg=darkgreen
highlight level5c guifg=darkcyan
highlight level6c guifg=darkred
highlight level7c guifg=darkmagenta
highlight level8c guifg=brown
highlight level9c guifg=gray
highlight level10c guifg=black
highlight level11c guifg=darkmagenta
highlight level12c guifg=Darkblue
highlight level13c guifg=darkgreen
highlight level14c guifg=darkcyan
highlight level15c guifg=darkred
highlight level16c guifg=red



" These are the regions for each pair.
" This could be improved, perhaps, by makeing them match [ and { also,
" but I'm not going to take the time to figure out haw to make the
" end pattern match only the proper type.
syntax region level1 matchgroup=level1c start=/(/ end=/)/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level2 matchgroup=level2c start=/(/ end=/)/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level3 matchgroup=level3c start=/(/ end=/)/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level4 matchgroup=level4c start=/(/ end=/)/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level5 matchgroup=level5c start=/(/ end=/)/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level6 matchgroup=level6c start=/(/ end=/)/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level7 matchgroup=level7c start=/(/ end=/)/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level8 matchgroup=level8c start=/(/ end=/)/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level9 matchgroup=level9c start=/(/ end=/)/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level10 matchgroup=level10c start=/(/ end=/)/ contains=TOP,level10,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level11 matchgroup=level11c start=/(/ end=/)/ contains=TOP,level11,level12,level13,level14,level15, level16,NoInParens
syntax region level12 matchgroup=level12c start=/(/ end=/)/ contains=TOP,level12,level13,level14,level15, level16,NoInParens
syntax region level13 matchgroup=level13c start=/(/ end=/)/ contains=TOP,level13,level14,level15, level16,NoInParens
syntax region level14 matchgroup=level14c start=/(/ end=/)/ contains=TOP,level14,level15, level16,NoInParens
syntax region level15 matchgroup=level15c start=/(/ end=/)/ contains=TOP,level15, level16,NoInParens
syntax region level16 matchgroup=level16c start=/(/ 
