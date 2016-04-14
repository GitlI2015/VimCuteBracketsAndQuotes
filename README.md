# VimCuteBracketsAndQuotes

This is NOT a plugin! You only need to copy some code to you .vimrc file! That's all!

By using this, you can make your Vim as cute as IDE when you type brackets and quotes.

Main Funtions:

1. If you type {<cr> you will get a } automatically and an empty line will be prepared with good indent;

  def function{
    |
  }

2. When you type a ( , if there is BLANK at the right side, you will get (|). Same for [ and {;

3. when you are in this situation: XXX|), if you type ), you will get XXX)|. Same for [ and {;

4. For quotes (' and "), I will use ' as an example to show the function:

if there is a \ before cursor, like this: \|, you will always get \'| after you type ';

else if you have a ' after cursor, like this: XXX|', you will get XXX'| after you type ';

else if you have a ' before cursor, like this: XXX'|, you will get XXX''| after you type ';

else if ther is BLANK at the right side, like this XXX|, you will get XXX''| after you type '.

5. If now you have (|), [|], {|}, '|' or "|" (| means cursor) and you are in insert mode, you can type \<BS\> to delete both characters and go back to insert mode. (Thank Jiahao for writing this part!)

***

Installation:

Copy all lines in vimCuteBracketsAndQuotes.txt to you .vimrc. 

(You need to change the code a little if you *set filetype indent on* instead of *set autoindent*.)

Yes! That's all!
