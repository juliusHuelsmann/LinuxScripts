
```VIM
echo, echom, messages
wrap, shiftround, matchtime
unmap,nunmap, ...,  vmap, nmap, imap, noremap, nnoremap

"to upper / lower case in visual mode
U, u

:set number? 
:set number!
:set multiple flags="bla"
:set timeoutlen=500

" local settings; not all settings can also be
" applied locally
" with "set" both the local and global variable
" are changed. "setlocal" only changes the local ones
:setlocal wrap

" localleader; ment to be file specific
:let maplocalleader = "\\"

" :wq
ZZ

" abbreviations
:iabbrev adn and

" put quotation marks around "word" respectively 'word'
<Leader>"
<Leader>'

" insert mode: jk is mapped to <esc>
```
### Edit and reload vimrc
` <Leader> + ev sv`



` :map <buffer> ... ` only maps the keybinding inside the current buffer
In general, in that case, the localleader should be preferred over
the global leader.
Related to setlocal commands.
The :map <buffer> bindings do always overvrite the :map ... bindings ,even though 
created earlier. (shadowing)


