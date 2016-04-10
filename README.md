# VimCuteBracketsAndQuotes

不需要使用插件！仅仅更改vimrc！即可让你的Vim在输入括号和引号时和IDE一样智能！

主要功能：

1. 在行末输入 ( 和 [ 时自动出一个对应的右括号；

2. 输入 { 并回车时会自动出右花括号并且帮你换行缩进什么的；

3. 如果你cursor的右边是右括号，那么输一个右括号等价于按一下右方向键；

4. 行末输入引号自动再出一个引号；

5. 如果你cursor的右边是引号，那么输一个引号等价于按一下右方向键。



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
