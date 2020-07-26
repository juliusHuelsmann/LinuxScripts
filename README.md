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
 * [x] Yu, B., Singh, M. P., & Sycara, K. (2004, August). Developing trust in large-scale peer-to-peer systems. In Multi-Agent Security and Survivability, 2004 IEEE First Symposium on (pp. 1-10). IEEE. Quations ~300
 * [x] Shree, S. U., Basha, D., & Saleem, M. S. (2014). An exhaustive survey of trust models in p2p network. arXiv preprint arXiv:1411.3294. barely any quotation.
 * [ ] Bolton, G. E., & Ockenfels, A. (2009). The limits of trust in economic transactions: Investigations of perfect reputation systems. eTrust: Forming Relationships in the Online World, 15-36. Quoted.
 * [x] Resnick, P., Kuwabara, K., Zeckhauser, R., & Friedman, E. (2000). Reputation systems. Communications of the ACM, 43(12), 45-48. QUoted >> 2k. https://dl.acm.org/citation.cfm?id=355122
 * [ ] webjsmin https://github.com/ethereum/web3.js/blob/1.0/dist/web3.min.js
 * [ ] https://www.datchley.name/es6-promises/
 * [ ] https://ethereum.stackexchange.com/questions/191/how-can-i-securely-generate-a-random-number-in-my-smart-contract
 * [ ] rust handbook, rust by example
 * [ ] proof of autohrity
 * [ ] https://medium.com/@merunasgrincalaitis/the-ultimate-end-to-end-tutorial-to-create-and-deploy-a-fully-descentralized-dapp-in-ethereum-18f0cf6d7e0e
 * [ ] paxus made simple / live
 * [ ] https://blog.acolyer.org/2015/03/05/paxos-made-live/
 * [ ] flexible paxos
 * [ ] https://blog.remibergsma.com/2013/05/12/how-accurately-can-the-raspberry-pi-keep-time/
 * [ ] http://akosiorek.github.io/ml/2018/04/03/norm_flows.html
 * [ ] http://akosiorek.github.io/ml/2018/03/14/what_is_wrong_with_vaes.html
 * [ ] http://akosiorek.github.io/ml/2018/03/14/what_is_wrong_with_vaes.html
 * [ ] 
```latex
 @InProceedings{Taigman_2014_CVPR,
   author = {Taigman, Yaniv and Yang, Ming and Ranzato, Marc'Aurelio and Wolf, Lior},
   title = {DeepFace: Closing the Gap to Human-Level Performance in Face Verification},
   booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
   month = {June},
   year = {2014}
 }
```

 * [ ] https://stackoverflow.com/questions/840321/how-can-i-see-the-assembly-code-for-a-c-program
 * [ ] https://www.ibm.com/developerworks/rational/library/inline-assembly-c-cpp-guide/
 * [ ] https://www.startpage.com/do/asearch?hmb=1&cat=web&cmd=process_search&language=english&engine0=v1all&query=c%2B%2B%20get%20next%20executed%20assembly%20instruction&abp=-1&t=black&nj=0&pg=0
 * [ ] https://sourceware.org/gdb/wiki/Internals
 * [ ] libgdb
 * [ ] https://www.google.com/search?client=firefox-b-ab&ei=HnnpW5_NEozAgAaCvbPoBw&q=c%2B%2B+iterate+through+instructions+on+assembly+call+stack&oq=c%2B%2B+iterate+through+instructions+on+assembly+call+stack&gs_l=psy-ab.3...17416.21163.0.21330.0.0.0.0.0.0.0.0..0.0....0...1c.1.64.psy-ab..0.0.0....0.NHjsL-Ay1Oc
 * [ ] https://www.google.com/search?client=firefox-b-ab&ei=HnnpW5_NEozAgAaCvbPoBw&q=c%2B%2B+iterate+through+instructions+on+assembly+call+stack&oq=c%2B%2B+iterate+through+instructions+on+assembly+call+stack&gs_l=psy-ab.3...17416.21163.0.21330.0.0.0.0.0.0.0.0..0.0....0...1c.1.64.psy-ab..0.0.0....0.NHjsL-Ay1Oc
 * [ ] https://www.reddit.com/r/StartpageSearch/comments/djshn3/hello_reddit_startpage_mod_team/
 * [ ] https://github.com/DaemonSnake/unconstexpr
 * [ ] https://github.com/falemagn/fameta-counter
 * [ ] https://github.com/DaemonSnake/unconstexpr-cpp20


### First pass papers
This file contains an overview of the papers I recently red (only superficially in one pass). Sorted by time of reading in reverse order. (✓✓) only given if the observed parts of the paper are extremely well written.


#### DATE SUBJECT

##### Notes

##### Q



#### `2018-10-02` SUBJECT

##### Notes

##### Q

```latex
@inproceedings{bhattacharyya2018long,
  title={Long-term on-board prediction of people in traffic scenes under uncertainty},
  author={Bhattacharyya, Apratim and Fritz, Mario and Schiele, Bernt},
  booktitle={Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition},
  pages={4194--4202},
  year={2018}
}
```


#### `2018-10-02` SUBJECT (revisit)

##### Notes

##### Q

```latex
@article{yagi2017future,
  title={Future Person Localization in First-Person Videos},
  author={Yagi, Takuma and Mangalam, Karttikeya and Yonetani, Ryo and Sato, Yoichi},
  journal={arXiv preprint arXiv:1711.11217},
  year={2017}
}
```


#### `2018-10-02` Siamese Networks (possibly revisit)

##### Q
- category: proposes Siamese NN for facial verification
- Siamese Networks
  - use cases: 
    - recognition + verification
    - number training / class can be very low
    - classes do not need to be known during training
  - not useful alternatives
    1. Distance based methods (compute similarity metric between pattern and lib of stored prototypes)
    2. Generative models in reduced dimension space
  - idea: 
    - learn f : INPUT -> TARGET sth \| f(input) \|_1 maintains semantic 
      distance in input space
    - mapping f := convolutional NN

```latex
@inproceedings{chopra2005learning,
  title={Learning a similarity metric discriminatively, with application to face verification},
  author={Chopra, Sumit and Hadsell, Raia and LeCun, Yann},
  booktitle={Computer Vision and Pattern Recognition, 2005. CVPR 2005. IEEE Computer Society Conference on},
  volume={1},
  pages={539--546},
  year={2005},
  organization={IEEE}
}
```


#### `2018-10-01` Siamese Networks 
##### Notes
- `one shot learning` means to predict on the basis of only one single example of each new class
  - normally; for one shot learning, domain specific features are designed
    - works fine on similar inputs
    - does however not offer robust solution
- Siamese networks (see DeepFace paper)
  - := NN-architecture that contains two or more identical subnetworks model architecture (involves distance-based loss)
    - learns similarity of two pairs of inputs
    - training thus involves pairwise learning -> quadratic pairs to learn
  - advantages
    - more robust to class imbalance
    - good for one shot learning
    - learn similarity
  - Feature extraction
  - employ unique structure to naturally rank similarity between inputs

##### Q
- contribution: 
  1. Method for learning in `siamese neural networks`
  
  
```latex
@inproceedings{koch2015siamese,
  title={Siamese neural networks for one-shot image recognition},
  author={Koch, Gregory and Zemel, Richard and Salakhutdinov, Ruslan},
  booktitle={ICML Deep Learning Workshop},
  volume={2},
  year={2015}
}
```

#### `2018-10-01` Gaze Anticipation (revisit)
##### Notes
- point of gaze := point which human is fixating
- method (called Deep Future Gaze := `DFG`): 
  - GAN
    - GENERATOR: 
        1. (PREDICT FRAMES) Two-stream spatial temporal convolutional net 
           (3d-CNN); one for background; one for foreground 
        2. Second 3d-CNN employed for gaze anticipations on top 
    - DISCRIMINATOR
    - This GAN is used for predicting the future frames
- [Experimental results and code](https://github.com/Mengmi/deepfuturegaze_gan    )

##### Q
- contribution 
  1. Aforementioned method outperforms state-of-the-art methods
    - prediction of the point of gaze in the future (order of a few seconds)
  2. Introduces new egocentric dataset 
- reproducibility: ✓✓
- clarity: ✓
- correctness: ✓ even though I am extremely surprised that the prediction of the future frames in the next few seconds can be done reliably (gaze anticipation is stacked on top of that)

```latex
@inproceedings{zhang2017deep,
  title={Deep Future Gaze: Gaze Anticipation on Egocentric Videos Using Adversarial Networks.},
  author={Zhang, Mengmi and Ma, Keng Teck and Lim, Joo-Hwee and Zhao, Qi and Feng, Jiashi},
  booktitle={CVPR},
  pages={3539--3548},
  year={2017}
}
```

#### `2018-10-01`  Video summarization (revisit)
##### Notes
- video summarization := "compress" video by extracting important parts
  - viewpoint := yields `important` aspects of the image / video
  - applying the video summarization we receive similarity metrics wrt the
    viewpoint.
  - not one optimal viewpoint

##### Q
- contribution meta:
  - viewpoint specified as `similarity` (in a semantic sense) which, once
    again is depending on the aspect that is considered important.
  - focuses on video-level similarities (supervized) 
- core contribution:
  1. Proposes a novel video summarization method from multiple groups; inspired
     by Fisher's discriminant 
  2. Introduces a dataset for that purpose
  3. Developed optimization algorithm t
- usefulness:
  - can be used for feature extraction
- clarity: ✓✓
- correctness: ✓

```latex
@inproceedings{kanehira2018aware,
  title={aware Video Summarization},
  author={Kanehira, Atsushi and Van Gool, Luc and Ushiku, Yoshitaka and Harada, Tatsuya},
  booktitle={Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition},
  pages={7435--7444},
  year={2018}
}
```




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
 * [ ] auto pull before issuing ttt
 * [ ] disable the shutdown button on my mac
 * [ ] dive into vimlatex tool
 * [ ] register for blockchain
 * [ ] http://js.cytoscape.org/demos/images-breadthfirst-layout/
 * [ ] http://js.cytoscape.org/demos/visual-style/
 * [ ] ich glaube am besten weil gravity based http://js.cytoscape.org/demos/spread-layout/
 * [ ] besser http://js.cytoscape.org/demos/colajs-graph/
 * [ ] https://stackoverflow.com/questions/4205130/what-is-duck-typing
 * [ ] efm
 * [ ] fahrrad gestohlen melden
 * [ ] push the pacman fix script
 * [ ] likelihood free inference
 * [ ] http://akosiorek.github.io/ml/2018/03/14/what_is_wrong_with_vaes.html
 * [ ] iconic
 * [ ] pomdp
 * [ ] 45 to 60 seconds for each exercise
 * [ ] promotion mittowch 3
 * [ ] list all hints clion
 * [ ] git://sourceware.org/git/binutils-gdb.git
 * [ ] https://channel9.msdn.com/Events/GoingNative/2013/rand-Considered-Harmful
 * [ ] rvalue refs
 * [ ] https://wiki.archlinux.org/index.php/Mkinitcpio#Possibly_missing_firmware_for_module_XXXX
 * [ ] https://www.amazon.com/TWONE-White-Cloud-Magnetic-Holder/dp/B016C1ULHM
 * [ ] https://www.amazon.de/kwmobile-Magnet-Schl%C3%BCsselhalter-Organizer-Wolke/dp/B0759MW49S
 * [ ] (Recommended) Nexus 5 and Nexus 5X: We offer official installation scripts for the Nexus 5 and Nexus 5X. The images are built on top of Halium and KDE Neon (16.04 in the latest stable rootfs, 18.04 in the latest edge rootfs). You can find more information here
 * [ ] https://www.plasma-mobile.org/neon-arch-reference-rootfs/
 * [ ] https://www.zurbrueggen.de/shop/zurbrueggen-badhocker-norway-weiss.html
 * [ ] https://www.zurbrueggen.de/shop/wenko-turbo-loc-eckablage-turbo-loc.html
 * [ ] https://www.zurbrueggen.de/shop/schlafen/nachtkommoden/z2-nachtkommode-luca.html
 * [ ] https://stackoverflow.com/questions/388242/the-definitive-c-book-guide-and-list
 * [ ] https://www.gamedev.net/blogs/entry/2249317-a-guide-to-getting-started-with-boostasio/
 * [ ] fittnessstudio kündigen
 * [ ] https://blog.aurynn.com/2015/12/16-contempt-culture
 * [ ] disable second -- middle button -- clipboard
 * [ ] steuererklaerung!
 * [ ] https://www.ime.usp.br/~ddm/mac6916/mn.html
 * [ ] metis
 * [ ] master thesis recommendations coursea academic writing stanford and how to write an introduction stanford
 * [ ] find out what synclient is for arch
 * [ ] provide bigram / trigram support
 * [ ] question: is it possible to predict for the entire range of a time horizon or reuse the results of previous time horizons if not possible
 * [ ] include the notes from paperStudy into those in masterDefintiions
 * [ ] https://www.youtube.com/watch?v=Vtw7U5oMsJk
 * [ ] vim patch for relative line number and fold ? enabled. screen.c3872 get_cursor_rel
 * [ ] lnum misc2
 * [ ] second patch for displaying wc instead of words somehow.
 * [ ] wrapping
 * [ ] check topic logger for seg
 * [x] floating point exception debugging
 * [ ] extended target tracking using gaussian processes
 * [ ] export swu too early. to be done after compilation
 * [ ] build image later
 * [ ] https://quantum2.xyz/2017/08/11/using-visual-c-compiler-linux/
 * [ ] bbc single
 * [ ] https://neomutt.org/guide/gettingstarted
 * [ ] https://stackoverflow.com/questions/27687389/how-does-void-t-work
 * [ ] https://stackoverflow.com/questions/610245/where-and-why-do-i-have-to-put-the-template-and-typename-keywords
 * [ ] nmcli
 * [ ] https://www.fluentcpp.com/2018/05/08/std-iterator-deprecated/
 * [ ] dunst seems to hang
 * [ ] open simple terminal at directory
 * [ ] https://vt100.net/docs/vt100-ug/chapter3.html
 * [ ] https://stackoverflow.com/questions/41538095/evaluate-multivariate-normal-gaussian-density-in-c
 * [ ] https://cs.stanford.edu/people/widom/paper-writing.html
 * [ ] experiment, template, sense
 * [ ] mathilda
 * [ ] https://www.staff.uni-mainz.de/pommeren/Gedichte/Storm/blatt1.htm
 * [ ] https://www.janko.at/Raetsel/Gedichte/00/032.htm
 * [ ] https://www.cnx-software.com/2017/09/12/how-to-remove-watermarks-timestamps-from-photos-with-gimp/
 * [ ] https://lichess.org/practice
 * [ ] https://cppinsights.io/
 * [ ] code style: use noexcept whenever consteval is used
 * [x] https://akrzemi1.wordpress.com/2020/01/29/requires-expression/
 * [ ] http://b.atch.se/posts/constexpr-counter/
 * [ ] http://b.atch.se/posts/non-constant-constant-expressions/
 * [ ] https://msgpack.org/index.html
 * [ ] https://blog.tartanllama.xyz/spaceship-operator/
 * [ ] https://foonathan.net/2018/10/spaceship-proposals/
 * [ ] https://archive.ics.uci.edu/ml/datasets/Daily+and+Sports+Activities


### Notes
This section contains interesting notes or ways I solved some intermed. problem 
that I need to take a look at proabably later in time
 - change mouse speed via xinput --list-props --set-prop
 - ps -ejh for process tree, -aux for all
 - snipmate for touching new, filled file containing snippets, make :SnipMateOpen tab and edit and save
- lvalue := locator value (represetns  an object that opccupies some identifiable location in memory)
- rvalue 
- of course it is possible to return a lvalue from a function (but ugly).
- lvalues remain lvalues even if they are const. const lvalues are not assignable. The lvalues that can be changed are called `modifiable lvalues`
- language constructs operatinng on object values require rvalues as arguments.
  - all lvalues that are not arrays / functions / incomplete types canbe converted to rvalues
- basically * creates a lvalue from an rvalue 
- & creates a rvalue from a lvalue
  - otherwise defines reference types  (lvalue references)
- NOTE: constant lvaue refernece can be assigned rvalues (as there is no fear that the rvalue will actually change)
- CV-unqualified / CV-qualifier: const and volatile qualifier
```c++
int* p = &arr[0];
*(p + 1) = 10;   // OK: p + 1 is an rvalue, but *(p + 1) is an lvalue
```

- 

# Heap and free store
In Herb's book "Exceptional C++", he defines:

Heap: A dynamic memory area that is allocated/freed by the malloc/free functions.

Free Store: A dynamic memory area that is allocated/freed by new/delete.

Its possible for new and delete to be implemented in terms of malloc and free, so technically, they could be the same memory area. However, as the standard doesn't specify this, its best to treat them separatly, and not to mix malloc/delete or new/free.
- http://zamanbakshifirst.blogspot.com/search/label/heap (bjarne stroustrup
  - `I consistently use "free store" and "heap" is not a defined term in the C++ standard (outside the heap standard library algorithms, which are unrelated to new and malloc()). In relation to new, "heap" is simply a word someone uses (typically as a synonym to "free store") - usually because they come from a different language background`



# On default destructors / constructors
## What is the difference between virtual ~Class() {} or virtual ~Class = #default

### = default;
- considered not user-defined 
  - constructor: in case of value initialization for the constructor A* a = new A();
    a special kind of initialization that does not use a constructor at all will take place.
    `Zero-Initialization`.
  - destrucuto: if a base / member with inaccessible / deleted destructor, it will only compile if
    default destructor is selected and not if empty one is. However it will raise an exception
    when the class actually is removed.






