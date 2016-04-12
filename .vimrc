
inoremap {<CR> {<CR>}<ESC><BS>o

function! CuteLeftBracket(character1, character2)
	let l:line = getline(".")
	let l:nextCharacter = l:line[col(".")]
	if l:nextCharacter != a:character1
		exec "normal! a" . a:character2
		exec "normal! h"
	endif
endfunction

inoremap ( (<ESC>:call CuteLeftBracket('(', ')')<CR>a
inoremap [ [<ESC>:call CuteLeftBracket('[', ']')<CR>a

function! CuteRightBracket(character)
	let l:line = getline(".")
	let l:nextCharacter = l:line[col(".")]
	if l:nextCharacter == a:character
		exec "normal! l"
	else
		exec "normal! a" . a:character 
	end
endfunction

inoremap ) <ESC>:call CuteRightBracket(')')<CR>a
inoremap ] <ESC>:call CuteRightBracket(']')<CR>a
inoremap } <ESC>:call CuteRightBracket('}')<CR>a


function! CuteQuote(character)
	let l:line = getline(".")
	let l:nextCharacter = l:line[col(".")]
	if char2nr(l:nextCharacter) != 0
		if l:nextCharacter != a:character
			exec "normal! a" . a:character
			exec "normal! h"
		end
	end
endfunction
inoremap " "<ESC>:call CuteQuote("\"")<cr>a
inoremap ' '<ESC>:call CuteQuote("'")<cr>a

function! CuteDelete()
	let l:line = getline(".")
	let l:Character = l:line[col(".") - 3]
	let l:nextCharacter = l:line[col(".")]
	if col(".") != 2
		exec "normal x"
		if char2nr(l:nextCharacter) != 0
			exec "normal h"
			if (((l:nextCharacter == ")") && (l:Character == "(")) || 
						\((l:nextCharacter == "}") && (l:Character == "{"))	||
						\((l:nextCharacter == "]") && (l:Character == "["))	||
						\((l:nextCharacter == "'") && (l:Character == "'"))	||
						\((l:nextCharacter == "\"") && (l:Character == "\"")))	 
				exec "normal x"
			endif
		endif
	else
		if char2nr(l:Character) == 0
			exec "normal hx"
		endif
	endif
endfunction
"char2nr("\t") == 9
"char2nr("\ ") == 32

inoremap <BS> ..<ESC>:call CuteDelete()<CR>a<BS><BS>

