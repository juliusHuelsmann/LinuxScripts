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


### Notes
This section contains interesting notes or ways I solved some intermed. problem 
that I need to take a look at proabably later in time
 - change mouse speed via xinput --list-props --set-prop
 - ps -ejh for process tree, -aux for all
 - snipmate for touching new, filled file containing snippets, make :SnipMateOpen tab and edit and save


