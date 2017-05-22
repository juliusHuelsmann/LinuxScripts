# Content
This folder contains configuration files for some of my OS

## Notes on stuff being likely to be usable in the future:

notify-send "string" # for sending information (e.g. on git updates, battery power)



## Useful Commands / Installations

### Commands
```bash
nbdiff-web [ref [ref]]
nbdiff-web file1 file2
```


### Installation
#### Jupyter-notebook diff python tool

```bash
pip install nbdime

# do manual diffing
nbdiff notebook_1.ipynb notebook_2.ipynb
nbdiff-web notebook_1.ipynb notebook_2.ipynb

# integrate into git diff and merge
nbdime config-git --enable --global

# (after integration): web diff between references of jupyternotebook.
nbdiff-web [ref [ref]]
nbdiff-web file1 file2
# Merge conflict could not be resolved? Browse differences in web tool
nbdime mergetool



```
