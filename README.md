# Readings 
Attention: if you are currently editing and viewing the `README.md` file, 
remember that this file is read-only; only generated from `mdpp` files via
the python-script `markdown-pp.py`. 

>> ### Attention!
>> **Do only edit the mdpp files in this directory!** 

## Content
This repository contains notes on interesting [papers](readings/README.md),
a list of utilites and features I am currently unhappy withj and a list of 
papers / websites I want to read.



### Needed utilities
This file contains a list of utilities that is needed / things coming to my
mind to be automated or functionalities to find in some manpage for vim or
other tools I am using in my day-2-day working life.

#### Solved
 * [x] automate logging of feature requests or readings by execution of ctrld
       command 
    - done in this file and the file in reading list reading 
 * [x] include markdown files from other sources
    - using `markdown-pp [list of input files] -o result.md`: 
      - `!INCLUDE "filename"`
 * [x] fix the ct script
 * [x] the git pre-push hook does not work each time but only sometimes. fix that
 * [x] increase trackpoint pointers speed


#### Open 
 * [ ] open multiple markdown preview windows in different qutebrowser windows
      popping up underneath the current vim md file
 * [ ] use aliases in dmenu
 * [ ] copy pasting into dmenu
 * [ ] history of dmenu commands
 * [ ] the uuu tool fails when there are paranthesis in the message to be added. fix that
 * [ ] daemonize is always one step behind. Compare replacement of ct alias by function not using daemonize function but alias.
 * [ ] [VIM] find alternative for vim preview that is entirely open source, offers possibility to use multiple sessions
 * [ ] [VIM] livedown alternative: open qutebrowser session in vertical split underneath the vim window, maintaining the previous split setting
 * [ ] [OS] 1
 * [ ] asdf

### Reading list
This list contains files / websites to be read in the future.
 * [ ] https://codewords.recurse.com/issues/two/git-from-the-inside-out git from the inside out
 * [ ] https://rinuboney.github.io/2016/01/19/ladder-network.html
 * [ ] preimage attack
 * [ ] https://www.loganmarchione.com/2015/12/brief-introduction-gpg/
 * [ ] read on model ensembles bagging and boosting
 * [ ] read on model ensembles bagging and boosting
 * [ ] papernot et al
 * [ ] deep pwning
 * [ ] https://dougblack.io/words/zsh-vi-mode.html
 * [ ] https://medium.com/loom-network/dappchains-scaling-ethereum-dapps-through-sidechains-f99e51fff447
 * [ ] https://www.datchley.name/es6-promises/
 * [ ] cbone
 * [ ] rust
 * [ ] yolo
 * [ ] go
 * [ ] https://link.springer.com/chapter/10.1007/978-3-540-45160-0_2
 * [ ] https://books.google.de/books?hl=de&lr=&id=UvA2MOJ7nBQC&oi=fnd&pg=PA15&dq=why+reputation+systems+are+flawed&ots=Pl6er33J-i&sig=tU01-vQ484lytxW9a0tHhk_2YDs#v=onepage&q=why%20reputation%20systems%20are%20flawed&f=false
 * [ ] https://dl.acm.org/citation.cfm?id=355122
 * [ ] webjsmin https://github.com/ethereum/web3.js/blob/1.0/dist/web3.min.js
 * [ ] https://www.datchley.name/es6-promises/
 * [ ] https://ethereum.stackexchange.com/questions/191/how-can-i-securely-generate-a-random-number-in-my-smart-contract
 * [ ] rust handbook, rust by example
 * [ ] proof of autohrity


### Tasks
#### a) Solved
 * [x] make tasks work
 * [x] version control the rofi config
 * [x] configure rofi to lokk nice
 * [x] finish configuration qutebrowser
 * [x] version control the new qutebrowser config
 * [x] qutebrowser setup for new qv
 * [x] improve dunst config
 * [x] resize windows also with hjkl for i3
 * [x] ViM aliases for comments, for loop, if, stuff
 * [x] fix snipmate
 * [x] register for aim3
 * [x] fix the script i wrote for opening up the cpp file from h file
 * [x] ViM aliases for comments, for loop, if, stuff
 * [x] vim colorscheme and config: disable the current line col highlighting in all window that is not active. disable 80char line too. set background black also in inactive windows.
 * [x] disable mouse movement enabling focus change on windows i3
 * [x] ns3 dim inactive windows?
 * [x] send offer 2db
 * [x] ticket
 * [x] setup working env
 * [x] notifysend merken

#### b) Open 
 * [ ] mail encryption
 * [ ] man rsa
 * [ ] got a clue on why some operations do not work. 
       Need to be escaped somhow. the and sign is recognized as command too
 * [ ] newline and formatting in messages i3
 * [ ] keyring format list packing dump
 * [ ] alex molla machine learning
 * [ ] it seems like some applications fail to repaint. That succs. Some apps start with wrong glqq resolution grqq and some hang after a certain time. analyse the system error log
 * [ ] dirty bits
 * [ ] https://stackoverflow.com/questions/27703139/disable-cursorcurrent-line-highlight-for-vim-tmux
 * [ ] https://hadoop.apache.org/docs/r1.2.1/mapred_tutorial.html
 * [ ] frozentux iptables tut for netsec
 * [ ] line ueberschreiben in vim an autocommand, nur fuer code, haengen
 * [ ] st
 * [ ] dwm
 * [ ] switch light and dark mode for in sun / evening; light mode incl terminal dmenu dunst vim
 * [ ] steuererklaerung
 * [ ] dhcp tunneling tcp


### Notes
This section contains interesting notes or ways I solved some intermed. problem 
that I need to take a look at proabably later in time
 - change mouse speed via xinput --list-props --set-prop
 - ps -ejh for process tree, -aux for all
 - snipmate for touching new, filled file containing snippets, make :SnipMateOpen tab and edit and save

