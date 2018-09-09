## Change rooting

```Bash
// Virtual filesystem (`process information pseudo filesystem`, contains
runtime system information (memory, mounteddevs info, hardware config)
mount --types proc /proc [other proc]
```


### supplemental information

https://www.tldp.org/LDP/Linux-Filesystem-Hierarchy/html/the-root-directory.html
#### Process information pseudo-filesystem `man proc`
- A lot of system utils are calls to files in this directory. 
- Contains system infromation (memory, devices mounted, hardware config, kernel
parameters, ...)
- all files have size 0 (except for a few files)
- number folders: process id; contains command line arguments, last cpu in
  which it was executed, current working directory, environment variables,
link to executable, (directory file descriptors, memory maps, memory held by
prc, root dir of process, status)
`lsmod := cat /proc/modules`
`lspci := cat /proc/pci`


####`sys` directory
- as `proc` `sys` is a pseudo file system and stores kernel information
- was once ment to replace /prc/, contains the same information as in /proc/,
  obly better sorted. 
- driver framework in the kernel automatically created directories under
  syswhen drivers are registered



### other:
- opt: addon application software packages
- sbin: essential system binaries
- bin: essential command binaries
  - vmlinuz kernel
- lib kernel modules
- dev
- var variable data (system log, mail printer stuff)
- usr bin header doc share: arch independent 
- srv data served by system


# required to mount
/proc/, /sys/, /dev/






# Update Gentoo

emerge --sync 
eix-update

(what to be mounted and why?) from tutorial
`/etc/resolv.conf`









i am currently using uefi: `/sys/firmware/efi` exists

dmidecode


# switch journaling off!!
https://askubuntu.com/questions/76913/how-can-i-check-if-a-particular-partition-ext4-is-journaled

my problem with installing gentoo:
- my networking hardware seems to be too new for the kernel version that is
  delivered in the livedvd (which I need as I have UEFI and am unable to boot
  to the minimal installation cd)


i am currently using uefi : `/sys/firmware/efi` exists

# dmidecode
- dmi := desktop management interface (system management bios =: SMBIOS)
- for looking for instance into  the current version of the UEFI
- for f.i. printing the serial number `sudo dmidecode -s system-serial-number`


# qemu
can be used for checking isos ;) 
-> virtual machine booting ub from usb via qmenu -hda /dev/sdb (if @ sdb)
(in theory. you need to use qemu as qemu-[architecture] and the flags do not
work)

## dd if= of= bs=819k



## kernel modules (mainly irrelevant if there are no problems)
`lsmod` shows status of kernel modules 
`modprobe [MODULE_NAME]` # load module
`modprobe -rv [MODULE_NAME]` # remove the module

## Change keyboard
# (check if layout available in the file referenced in this text file)
vim /etc/conf.d/keymaps de-latin1 
rc-service keymaps restart

## Add / remove user
useradd -m - G groupname username 
passwd user

## setup network connection
- find out the interface's name: `ifconfig`  or better `ip addr`
  - predictable  network interface names
- `net-setup` is a script for setting up network connectivity in a wizard



## Use flags

## Files
- `/etc/portage/repos.conf/gentoo.conf` (initally copied from
  `/usr/share/portage/config/repos.conf`)
- `/etc/portage/make.profile` profile the system listens to. There is a
  hierarchy of profiles that contribute to the USE flags. 
- `/usr/portage/profiles/base` top profile
- by order
  1. `make.defaults` do not edit, overwritten
  2. `/etc/portage/make.conf` define use flags here. 
    (as diff to the make.defaults not used use flags are prefixed by `-`
    - example `USE="-kde -qt4 -qt5 ldap"`
  3. package specific: `etc/portage/package.use`  
     (can be single file, can be directory)
    - example `media-video/vlc bluray`
  4. user-defined use setting as environment variable

## commands
- `emerge --info | grep ^USE` #< gives the currently active use flags
- `USE="-pulseaudio" emerge www-client/seamonkey` temporarily  remove
  pulseaudio from  seamonkey package
- adapt system to new use flags `emerge --update --deep --newuse @world`
- Attention, dangerous; removes obsoleted packages. (-p lists, then remove
  without that flag) `emerge -p --depclean`
- `revdep-rebuild`rebuild apps dynamically linked against shared obj., provided
  by removed packages
- Check for the use flags a program 'provides' `emerge --pretend --verbose
  [PACKAGE]
- for check which pacakages uses stuff, `equery --nocolor uses =gnumeric-1.12.31`

## Required_use
- REQUIRED_USE="foo?(stuff that needs to be fullfilled)" 
  - || (stuff1 stuff2 ... ) (or all the stuff (= at least one))
  - ?? (a b c ...) at most one of them must be set
  - ^^ (a b c ...) exactly one  (|| or ??)

## CFLAGS
- -march=native -mtune=native
- optimizations: `O2` as O3 tends to cause problems
- use -pipe
```CFLAGS="-march=native -O2 -pipe"
# Use the same settings for both variables
CXXFLAGS="${CFLAGS}"
```
## Other options that can be set there
MAKEOPTS="-j2"
GENTOO_MIRRORS= #< this can be easily filled via mirrorselect -i -o >> config
file

## System - wide
- `etc/portage/make.conf`
  - man make.conf when in gentoo
- cflags and stuff

## Package wide
`export` sets these variables temporarily



/etc/resolv.conf contains ddr of name server



update the repos
- `emerge --sync` returns that x new items need reading.
  - `eselect `
    - news 
      - `read`
      - `list` 
      - `purge` can be removed once they have been read; will not be reread
        anymore
    - `profile` specifies default values for `USE, CFLAGS, ..`

  - `man news.eselect`




use flags relevant for me
```bash
X # support for x11

# DVD
a52 #< decoding atsc a/52 streams in dvd
aac # mp4 aac audio
aalib

qt5

```
