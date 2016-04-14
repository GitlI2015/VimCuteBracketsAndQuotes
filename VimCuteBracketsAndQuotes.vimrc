"inoremap {<cr> {<cr><BS>}<ESC>O    
"if set filetype indent on, please use the line above.

inoremap {<cr> {<cr>}<ESC>O<TAB>
"if you only set autoindent, please use the line above

function! CuteLeftBracket(character1, character2)
	let l:line = getline(".")
	let l:nextCharacter = l:line[col(".")]
	if (char2nr(l:nextCharacter) == 0) 
		\ || (char2nr(l:nextCharacter) == 9) 
		\ || (char2nr(l:nextCharacter) == 32)
		execute "normal! a" . a:character2
		execute "normal! h"
	endif
endfunction

function! CuteRightBracket(character)
	let l:line = getline(".")
	let l:nextCharacter = l:line[col(".")] 
	if l:nextCharacter == a:character 
		execute "normal! x"
	else
		execute "normal! r" . a:character
	endif
endfunction

inoremap ( (<ESC>:call CuteLeftBracket('(', ')')<cr>a
inoremap [ [<ESC>:call CuteLeftBracket('[', ']')<cr>a
inoremap { {<ESC>:call CuteLeftBracket('{', '}')<cr>a
inoremap ) .<ESC>:call CuteRightBracket(')')<cr>a
inoremap ] .<ESC>:call CuteRightBracket(']')<cr>a
inoremap } .<ESC>:call CuteRightBracket('}')<cr>a
"above are something which can make vim use ()[]{}just like Xcode

function! CuteQoute(character)
	let l:line = getline(".")
	let l:lastCharacter = l:line[col(".") - 2]
	let l:nextCharacter = l:line[col(".")] 
	"notice that we has inserted a quote befor we use this function
	"before the <ESC> works, it is like this [lastCharacter][samequote][cursor'|'][nextCharacter]"

	if char2nr(l:lastCharacter) == 92
		execute
	elseif l:nextCharacter == a:character
		execute "normal! x"
	elseif l:lastCharacter == a:character
		execute
	elseif (char2nr(l:nextCharacter) == 0) 
		\ || (char2nr(l:nextCharacter) == 9) 
		\ || (char2nr(l:nextCharacter) == 32)
		execute "normal! a" . a:character
		execute "normal! h"
	endif
endfunction

inoremap " "<ESC>:call CuteQoute("\"")<cr>a
inoremap ' '<ESC>:call CuteQoute("'")<cr>a
"above are something which can make vim use ''and \"" like Xcode

