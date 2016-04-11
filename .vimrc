inoremap {<CR> {<CR>}<ESC><BS>o

function! CuteLeftBracket(character1, character2)
	let l:line = getline(".")
	let l:nextCharacter = l:line[col(".")]
	if l:nextCharacter != a:character2
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
	if ((char2nr(l:nextCharacter) >= 33) && (char2nr(l:nextCharacter) <= 126))
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
	if col(".") != 1
		if ((char2nr(l:nextCharacter) >= 33) && (char2nr(l:nextCharacter) <= 126))
			let l:eoltest = l:line[col(".") + 1]
			exec "normal x"
			if (((l:nextCharacter == ")") && (l:Character == "(")) || 
						\((l:nextCharacter == "}") && (l:Character == "{"))	||
						\((l:nextCharacter == "]") && (l:Character == "["))	||
						\((l:nextCharacter == "'") && (l:Character == "'"))	||
						\((l:nextCharacter == "\"") && (l:Character == "\"")))	 
				exec "normal x"
			endif
			if ((char2nr(l:eoltest) >= 33) && (char2nr(l:eoltest) <= 126))
				exec "normal h"
			endif
		else
			exec "normal x"
		endif
	else
			if !((char2nr(l:nextCharacter) >= 33) && (char2nr(l:nextCharacter) <= 126))
			exec "normal x"
		endif
	endif
endfunction

inoremap <BS> aa<ESC>:call CuteDelete()<CR>a<BS><BS>

