# VimCuteBracketsAndQuotes
Make vim smart when you input brackets and quotes

It is so difficult to install a plugin for Vim, so I write the codes below.

You only need to paste it to you .vimrc and then your vim will be as cute as Xcode when you input brackets and quotes.

	"inoremap {<cr> {<cr><BS>}<ESC>O    
	"if set filetype indent on, please use the line above.

	inoremap {<cr> {<cr>}<ESC>O<TAB>
	"if you only set autoindent, please use the line above

	function! CuteLeftBracket(character1, character2)
		let l:line = getline(".")
		let l:nextCharacter = l:line[col(".")]
		if (char2nr(l:nextCharacter) >= 33) && (char2nr(l:nextCharacter) <= 126)
			execute "normal! a" . a:character1
		else
			execute "normal! a" . a:character1 . a:character2
			execute "normal! h"
		endif
	endfunction

	inoremap ( <ESC>:call CuteLeftBracket('(', ')')<cr>a
	inoremap [ <ESC>:call CuteLeftBracket('[', ']')<cr>a

	function! CuteRightBracket(character)
		let l:line = getline(".")
		let l:nextCharacter = l:line[col(".")] 
		if l:nextCharacter == a:character 
			execute "normal! l"
		else
			execute "normal! a" . a:character
		end
	endfunction

	inoremap ) <ESC>:call CuteRightBracket(')')<cr>a
	inoremap ] <ESC>:call CuteRightBracket(']')<cr>a
	inoremap } <ESC>:call CuteRightBracket('}')<cr>a
	"above are something which can make vim use ()[]{}just like Xcode

	function! CuteQoute(character)
		let l:line = getline(".")
		let l:nextCharacter = l:line[col(".")] 
		if l:nextCharacter == a:character 
			execute "normal! l"
		elseif (char2nr(l:nextCharacter) >= 33) && (char2nr(l:nextCharacter) <= 126)
			execute "normal! a" . a:character
		else
			execute "normal! a" . a:character . a:character
			execute "normal! h"
		end
	endfunction

	inoremap " <ESC>:call CuteQoute("\"")<cr>a
	inoremap ' <ESC>:call CuteQoute("'")<cr>a
	"above are something which can make vim use ''and \"" like Xcode
	
