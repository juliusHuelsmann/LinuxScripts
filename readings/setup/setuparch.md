
XXX are to be replaced with custom values


## inside live usb medium 
```bash
loadkeys de-latin1
# Verify boot mode (uefi ?). UEFI <-> dir does exist
ls /sys/firmware/efi/efivars 
```

### IF UEFI
```bash
lsblk #< for getting to know the partitions
gdisk /dev/XXX 
# d (all the partitions that are not in use)
# n:
# first partition: efi (type: ef00) for last sector set size: +512M
# w
```

```
mkfs.fat -F 32 -n EFIBOOT XXX 
mkfs.ext4 -L XXXLABEL XXX 
```

```
mount -L XXXLABEL /mnt
mkdir -p /mnt/boot
mount -L EFIBOOT /mnt/boot
```

```
#find out device name. incomple
ip link 
dhcpcd wlp58s0
wifi-menu

## OR
dhcpcd XXX:device_ethernet
``` 

```
# install system from mirrorlist
edit /etc/pacman.d/mirrorlist
pcstrap /mnt base base-devel intel-ucode wpa_supplicant dialog
```


```
# initiale fstab erzeugen für eingebudnene laufwerke
genfstab -p /mnt > /mnt/etc/fstab 
editieren 

## wichtig: für ssd: editieren der fstab mit
defaults, noatime,discard flags
also flags igs rw,defaults,noatime,deiscard für arch partition

- using the discard option for a moutn in /etc/fstab enables continuous trim in
  device oeprations.
-noatime : no access time storing in the journal.


```


```
arch-chroot /mnt/
echo LANG=de_DE.UTF-8 > /etc/locale.conf
echo LC_COLLATE=C >> /etc/locale.conf
echo LANGUAGE=de_DE >> /etc/locale.conf


echo KEYMAP=de-latin1 > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

#configure etc/hosts and further as in 
# https://wiki.archlinux.de/title/Anleitung_f%C3%BCr_Einsteiger

# install bootloader as in  https://wiki.archlinux.de/title/UEFI_Installation#systemd_bootctl_.28ehemals_Gummiboot.29
```


nach update initramfs neu generieren
mkinitcpio -p linux
