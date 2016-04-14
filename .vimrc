
inoremap {<CR> {<CR>}<ESC><BS>o

function! CuteLeftBracket(character1, character2)
	let l:line = getline(".")
	let l:nextCharacter = l:line[col(".")]
	if l:nextCharacter != a:character1 && !((char2nr(l:nextCharacter) >= 65) && (char2nr(l:nextCharacter) <= 90)) && !((char2nr(l:nextCharacter) >= 97) && (char2nr(l:nextCharacter) <= 122))
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
	let l:lastCharacter = l:line[col(".") - 2]
	if l:nextCharacter == a:character
		exec "normal x"
	elseif l:lastCharacter == a:character
	elseif !((char2nr(l:nextCharacter) >= 33) && (char2nr(l:nextCharacter) <= 122)) ||
				\(l:nextCharacter == ")") ||
				\(l:nextCharacter == "]") ||
				\(l:nextCharacter == "}") 
		exec "normal! a" . a:character
		exec "normal! h"
	endif
endfunction

inoremap " "<ESC>:call CuteQuote("\"")<cr>a
inoremap ' "<ESC>:call CuteQuote("'")<cr>a

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
						\((l:nextCharacter == "]") && (l:Character == "[")))	
				exec "normal x"
			elseif	(((l:nextCharacter == "'") && (l:Character == "'"))	||
						\((l:nextCharacter == "\"") && (l:Character == "\"")))	 
				let l:BackslashIndicator=l:line[col(".") - 3]
				let l:pos=col(".") - 3
				let l:counter=0
				while((l:pos > 0) && (l:BackslashIndicator == "\\"))
					let l:pos=l:pos - 1
					let l:counter=l:counter + 1
					let l:BackslashIndicator=l:line[l:pos]
				endwhile
				while(l:counter > 0)
					let l:counter=l:counter - 2
				endwhile
				if l:counter != -1
					exec "normal x"
				endif
			endif
		endif
	else
		if char2nr(l:Character) == 0
			exec "normal hx"
		endif
	endif
endfunction

inoremap <BS> ..<ESC>:call CuteDelete()<CR>a<BS><BS>

