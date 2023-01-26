"==============================================================================
"  Description: Rainbow colors for parentheses, based on rainbow_parenthsis.vim
"               by Martin Krischik and others.
"               2011-10-12: Use less code.  Leave room for deeper levels.
"==============================================================================
" GetLatestVimScripts: 3695 1 :AutoInstall: rainbow_parentheses.vim

let s:pairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['black',       'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]
let s:pairs = exists('g:rbpt_colorpairs') ? g:rbpt_colorpairs : s:pairs
let s:max = exists('g:rbpt_max') ? g:rbpt_max : max([len(s:pairs), 16])
let s:loadtgl = exists('g:rbpt_loadcmd_toggle') ? g:rbpt_loadcmd_toggle : 0
let s:types = [['(',')'],['\[','\]'],['{','}'],['<','>']]

function! s:extend()
	if s:max > len(s:pairs)
		call extend(s:pairs, s:pairs)
		call s:extend()
	elseif s:max < len(s:pairs)
		call remove(s:pairs, s:max, -1)
	endif
endfunction
call s:extend()

function! rainbow_parentheses#activate()
	let [id, s:active] = [1, 1]
	for [ctermfg, guifg] in s:pairs
		exe 'hi default level'.id.'c ctermfg='.ctermfg.' guifg='.guifg
		let id += 1
	endfor
endfunction

function! rainbow_parentheses#clear()
	for each in range(1, s:max)
		exe 'hi clear level'.each.'c'
	endfor
	let s:active = 0
endfunction

function! rainbow_parentheses#toggle()
	if !exists('s:active')
		call rainbow_parentheses#load(0)
	endif
	let afunction = exists('s:active') && s:active ? 'clear' : 'activate'
	call call('rainbow_parentheses#'.afunction, [])
endfunction

function! rainbow_parentheses#toggleall()
	if !exists('s:active')
		call rainbow_parentheses#load(0)
		call rainbow_parentheses#load(1)
		call rainbow_parentheses#load(2)
	endif
	if exists('s:active') && s:active
		call rainbow_parentheses#clear()
	else
		call rainbow_parentheses#activate()
	endif
endfunction

function! s:cluster()
	let levels = join(map(range(1, s:max), '"level".v:val'), ',')
	exe 'sy cluster rainbow_parentheses contains=@TOP'.levels.',NoInParens'
endfunction
call s:cluster()

function! rainbow_parentheses#load(...)
	let [level, grp, type] = ['', '', s:types[a:1]]
	let alllvls = map(range(1, s:max), '"level".v:val')
	if !exists('b:loaded')
		let b:loaded = [0,0,0,0]
	endif
	let b:loaded[a:1] = s:loadtgl && b:loaded[a:1] ? 0 : 1
	for each in range(1, s:max)
		let region = 'level'. each .(b:loaded[a:1] ? '' : 'none')
		let grp = b:loaded[a:1] ? 'level'.each.'c' : 'Normal'
		let cmd = 'sy region %s matchgroup=%s start=/%s/ end=/%s/ contains=TOP,%s,NoInParens'
		exe printf(cmd, region, grp, type[0], type[1], join(alllvls, ','))
		call remove(alllvls, 0)
	endfor
endfunction

command! RainbowParenthesesToggle       call rainbow_parentheses#toggle()
command! RainbowParenthesesToggleAll    call rainbow_parentheses#toggleall()
command! RainbowParenthesesActivate     call rainbow_parentheses#activate()
command! RainbowParenthesesLoadRound    call rainbow_parentheses#load(0)
command! RainbowParenthesesLoadSquare   call rainbow_parentheses#load(1)
command! RainbowParenthesesLoadBraces   call rainbow_parentheses#load(2)
command! RainbowParenthesesLoadChevrons call rainbow_parentheses#load(3)

" vim:ts=2:sw=2:sts=2
