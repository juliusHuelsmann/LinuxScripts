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

### Reading list
This list contains files / websites to be read in the future.
 * [ ] https://codewords.recurse.com/issues/two/git-from-the-inside-out git from the inside out
 * [ ] https://rinuboney.github.io/2016/01/19/ladder-network.html
 * [ ] preimage attack


### Tasks
#### a) Solved
 * [x] make tasks work

#### b) Open 
 * [ ] have a look at interesting github repos by stars
 * [ ] mail encryption
 * [ ] rsa dsa
 * [ ] man rsa
 * [ ] got a clue on why some operations do not work. 
       Need to be escaped somhow. the and sign is recognized as command too
 * [ ] asn messy format. check up
 * [ ] newline and formatting in messages i3
 * [ ] nmap tends to fire up connection really quickly. rapsberry is not that fast, slow it down thus. 50 connections per second or less
 * [ ] how to talk to the service use netcat for thas
 * [ ] keyring format list packing dump
 * [ ] shadow file content. user database
 * [ ] shadow contains pw and stuff from passwd


### Notes
This section contains interesting notes or ways I solved some intermed. problem 
that I need to take a look at proabably later in time
 - change mouse speed via xinput --list-props --set-prop
 - ps -ejh for process tree, -aux for all

