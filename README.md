# VimCuteBracketsAndQuotes

This is NOT a plugin! You only need to copy some code to you .vimrc file! That's all!

By using this, you can make your Vim as cute as IDE when you type brackets and quotes.

Main Funtions:

1. When you type a ( or [ at the end of a line, a ) or ] will be typed automatically;

2. When you typed a { and then typed Enter, a } will be typed automatically and an empty line will be prepared with good indent;

3. If the character next to cursor is a right bracket, you can typed the bracket character to SKIP it;

4. If the character next to cursor is a quote, you can typed the quote character to SKIP it;

5. If now you have (|), [|], {|}, '|' or "|" (| means cursor) and you are in insert mode, you can type <ESC> and then type <BS> to delete both characters and go back to insert mode.

***

Installation:

Copy all lines in vimCuteBracketsAndQuotes.txt to you .vimrc. 

(You need to change the code a little if you `set filetype indent on` instead of `set autoindent`.)

Yes! That's all!
