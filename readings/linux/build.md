
# 0.  UEFI support (done)
Processor type and features  --->
    [*] EFI runtime service support 
    [*]   EFI stub support
    [*]     EFI mixed-mode support
 
Firmware Drivers  --->
    EFI (Extensible Firmware Interface) Support  --->
        <*> EFI Variable Support via sysfs

# 1. Find modules for devices
## a) from a running, completely functional kernel
Execute `detectModulesFromWorkingKernel.sh` (e.g. with root privileges for
making sure everything is detected, but non-root should also be sufficient).

### General steps
For finding out which network interface card currently is in used
1. Find the network device name of interest `ls /sys/class/net`, Check if the 
    interface is up and running; `ip addr`
2. Find the module name ```basename `readlink /sys/class/net/wlp48s0/device/driver/module```
3. Find the kernel configuration controlling it.
4. enable it in the settings ;)

Perform that for each entry in `lsusb`, each network device and each device
inside lspci.


### Example
#### Step 1) Interface name
Find interfaces, start with for instance the wifi interface device:
```bash
> ls /sys/class/net/
(...)
enp0s31f6
```
The `ip addr` command shows that it's an ethernet devic having valid ip
addresses assigned.
```bash 
> ip addr
(...)
2: wlp58s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1440 qdisc mq state UP group default qlen 1000
    link/ether f8:59:71:49:99:4f brd ff:ff:ff:ff:ff:ff
    inet 172.18.77.14/16 brd 172.18.255.255 scope global dynamic noprefixroute wlp58s0
       valid_lft 2925sec preferred_lft 2925sec
    inet6 fe80::42ba:57e9:51ae:544e/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
``` 

#### Step 2) Module name
The device module is referenced in the directory `device/driver/module` located
in the aforementioned device's directory (`/sys/class/net/[iface_name]`). The
reference points to the general devices directory `/sys/devices`
```bash
>ls /sys/class/net/wlp58s0 -la | grep device
lrwxrwxrwx 1 root root 0 Aug 24 23:35 /sys/class/net/wlp58s0 -> /sys/devices/pci0000:00/0000:00:1c.2/0000:3a:00.0/net/wlp58s0
```
For finding out which module is used, follow the symlink and strip the path:
```bash
> basename `readlink /sys/class/net/wlp48s0/device/driver/module`
iwlwifi
```
Thus the module `iwlwifi` controls the module of interest.


#### Step 3) Detect corresponding configuration option
- find -type f -name Makefile | xargs grep e1000 | grep CONFIG_


#### Step 4) 
- Enable the configuration in the kernel configuration
- Location of kernel configuration in distribution kernel `/proc/config.gz`












## b) from scratch
- Use case:
   - in case some module is not working at the currently running (live) system
     (e.g. added new hardware)
- Properties
   - as general as it can be not taking into account that the follwoint steps
     might differ depending on the acutal peace of hardware that is to be
     supported; example: PCI and USB dev interface


### PCI
vendor id + device id = uid(device) used by the kernel to match a driver to a
device; the correct module names can be infrerred from it.

1. Detect the identifier of the pci device `lspci`
  - consider `00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (4) I219-LM (rev 21)`
    - format: [PCI Bus ID]: [Class], [vendor] [SDevice] rev ([revision number])
    - PCI BUS ID : `00:1f.6`
    - class: `Ehternet controller`
    - vndor: `Intel corporation`
    - revision number: `21`
    - additional information shown in verbose mode.
  - More information can be found in the sys virtual file system  `sys` under
    the directory `/sys/bus/pci/devices`.
2. `cd /sys/bus/pci/devices/0000:00:1f.6; cat vendor device` 
  - prints out the vendor id and the device id which together make up the
    unique identifier of the device
3. find the suitable kernel module as import in the kernel header files.
  1. search for preprocessor variable pointing to the device in question. for id
    \in {[vendor id], [Device_id]} conduct one of the follwing searches:
    - for a search in the entire sources: `grep -irnw  [LINUX_SRC_ROOT_DIR] -e  [id]` 
    - for pci devices, it is save to restrict that search to the file
      `include/linux/pci_ids.h` via `grep -i [id] include/linux/pci_ids.h.
    - in my case: 
      - change directory into the linux source rood dir `cd /mnt/os2/usr/src/linux` 
      1. `grep -i 0x8086 include/linux/pci_ids.h` -> `#define PCI_VENDOR_ID_INTEL		0x8086`
      2. `grep -i 0x15d7 include/linux/pci_ids.h` -> `` (not found)
        - grep -rnw . -e 0x15d7 -> `./drivers/net/ethernet/intel/e1000e/hw.h:95:#define E1000_DEV_ID_PCH_SPT_I219_LM4		0x15D7` (among others)
      - so basically the variables involved are PCI_VENDOR_ID_INTEL and E1000_DEV_ID_PCH_SPT_I219_LM4
  2. `grep -Rl PCI_VENDOR_ID_INTEL *` and check each file if it contains the
     correct  device identifier. If doing so manually, it might be beneficial
     to start off with the preprocessor variable's name for the device
     identifier and for the device identifier itself (3 results in this case) 
     and check the vendor identifier there. 
    - `{ PCI_VDEVICE(INTEL, E1000_DEV_ID_PCH_SPT_I219_LM4), board_pch_spt },
    - `e1000e`
4. last step: find the corresponding module in the make file; check for the
   string like CONFIG_*
```
find -type f -name Makefile | xargs grep e1000e | grep CONFIG_
./drivers/net/ethernet/intel/e1000e/Makefile:obj-$(CONFIG_E1000E) += e1000e.o
./drivers/net/ethernet/intel/Makefile:obj-$(CONFIG_E1000E) += e1000e/
```
5. search in the kernel config system for that config value and go to the
   location in the wizard that it specifies to be enabled.

### USB
use `lsubs` instead of `lspci` and ignore those devices with id 0000:0000 as
those are USB host controllers that drive the bus.
Note: Deivice NUMBERS are not unique (the numbers counting up from 001 to ???)
so identify it via the device identifier which is shown as
[VENODR_ID]:[DEV_ID] directly inside `lsusb`.

Search for the vendor id in the `drivers` subdirectory of the linux kernel
sources.




# 2. Devices

## 2a) USB storage
1. check if usb dev present `lsusb -v | grep Storage -> `bInterfaceClass         8 Mass Storage`
2. usb device: enable DeviceDrivers/SCSIDeviceSupport/SCSIDeviceSupport and SCSIDiskSupport
3. usb storage: enable DeviceDrivers/UsbSupport/UsbMassSotrageSupport as a module


## 2b) hd
The most common types of interfaces provided nowadays by disk controllers are PATA (IDE) and Serial ATA for home use. 
High-end disks use SCSI, Fibre Channel or Serial Attached SCSI.
1. find out which kind of disk controller is used `lshw -class disk -class storage | grep -i controller` (alternatively grep on lspci)
  1. IDE:
    1. `Bus options (PCI, PCMCIA, EISA, MCA, ISA)`/`PCI Support`
    2. `Device Drivers`/`ATA/ATAPI/MFM/RLL support` and `Enhanced IDE/MFM/RLL disk/cdrom/tape/floppy support`
    3. `Device Drivers`/`ATA/ATAPI/MFM/RLL support`/`generic/default IDE chipset support`
    4. `Device Drivers`/`ATA/ATAPI/MFM/RLL support`/`PCI IDE chipset support`
  2. SATA
    - `Bus options (PCI, PCMCIA, EISA, MCA, ISA)`/`PCI Support`
    - `Device Drivers`/`SCSI Device Support`/`SCSI Device Support` and `SCSI Disk support`
    - `Device Drivers`/`SCSI Device Support`/`SCSI low-level drivers`/`Serial ATA (SATA) support`` and look up the specific type of disk controller (back in lspci) and select it under that config path:e.g. `Intel PIIX/ICH SATA support`
  3. SCSI (do that in either case ;))
    - `Device Drivers`/`SCSI Device Support`/`SCSI Disk support`
    - `Device Drivers`/`SCSI Device Support`/`SCSI Device support`




## 2c: USB

Bus options (PCI, PCMCIA, EISA, MCA, ISA)
	[*] PCI Support

Device Drivers
	USB Support
		[M] Support for Host-side USB

Device Drivers
	USB Support
	---   USB Host Controller Drivers
	[M]   EHCI HCD (USB 2.0) support
	[M]   OHCI HCD support
	[M]   UHCI HCD (most Intel and VIA) support





## 2d: SOund (ALSA)
```bash
> lspci | grep -i audio
00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)
```
```
Device Drivers
    Sound
        [M] Sound Card Support
Enable ALSA:

Device Drivers
    Sound
        [M] Sound Card Support
            [M] Advanced Linux Sound Architecture
```

```bash
# Enable the specific type of sound device that you have. PCI sound cards are under the PCI submenu:

Device Drivers
    Sound
        [M] Sound Card Support
            [M] Advanced Linux Sound Architecture
                PCI Devices





If USB input devices (like keyboard or mouse) or other USB devices will be used, do not forget to enable those as well (CONFIG_HID_GENERIC and CONFIG_USB_HID, CONFIG_USB_SUPPORT, CONFIG_USB_XHCI_HCD, CONFIG_USB_EHCI_HCD, CONFIG_USB_OHCI_HCD):

```
KERNEL Activating USB support for input devices
Device Drivers --->
  HID support  --->
    -*- HID bus support
    <*>   Generic HID driver
    [*]   Battery level reporting for HID devices
      USB HID support  --->
        <*> USB HID transport layer
  [*] USB support  --->
    <*>     xHCI HCD (USB 3.0) support   (containing generic xHCI driver for a
                                          platform device)
    <*>     EHCI HCD (USB 2.0) support
    (<*>     OHCI HCD (USB 1.1) support)
```




```

[https://www.linuxtopia.org/online_books/linux_kernel/kernel_configuration/ch08.html](src)











## 3) CPU
```bash
>lspci | grep -i audio
00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)
```
1. select subarchitecture type 
```
Processor type and features
    Subarchitecture Type
        (X) PC-compatible
        ( ) AMD Elan
        ( ) Voyager (NCR)
        ( ) NUMAQ (IBM/Sequent)
        ( ) Summit/EXA (IBM x440)
        ( ) Support for other sub-arch SMP systems with more than 8 CPUs
        ( ) SGI 320/540 (Visual Workstation)
        ( ) Generic architecture (Summit, bigsmp, ES7000, default)
        ( ) Support for Unisys ES7000 IA32 series
XXX:
```
2. Select processor type + features
  - Next select the exact processor type. It is also recommended to enable MCE features (if available) so that users are able to be notified of any hardware problems
  - printed to dmesg or `/dev/mcelog`
  - XXX: install `app-admin/mcelog` package afterwards
```bash
Processor type and features
    Processor family
        (X) Generic-x86-64
```

3. Enable multiprocessing:
```bash
Processor type and features
    [*] Symmetric multi-processing support
```

4. enable suspend if needed
5. CPU Frequency scaling (slow down for saving batttery live)
```

Enable the basic frequency scaling functionality:

Power management options (ACPI, APM)
    [*] CPU Frequency scaling
Select the different type of frequency governors you wish to use:

Power management options (ACPI, APM)
    [*] CPU Frequency scaling
    [*]   'performance' governor
    [*]   'powersave' governor
    [*]   'userspace' governor for userspace frequency scaling
    [*]   'ondemand' cpufreq policy governor
    [*]   'conservative' cpufreq governor
For more information on what the different governors do, see CPU_FREQ.

Select the default governor you wish to have running when the maching boots:

Power management options (ACPI, APM)
    [*] CPU Frequency scaling
          Default CPUFreq governor (performance)
Select the specific processor type on the machine. For details on how to determine the processor type of the machine, see the section called “Processor Types”.

Power management options (ACPI, APM)
    [*] CPU Frequency scaling
    ---   CPUFreq processor drivers
    [ ]   ACPI Processor P-States driver
    [ ]   AMD Mobile K6-2/K6-3 PowerNow!
    [ ]   AMD Mobile Athlon/Duron PowerNow!
    [ ]   AMD Opteron/Athlon64 PowerNow!
    [ ]   Cyrix MediaGX/NatSemi Geode Suspend Modulation
    [*]   Intel Enhanced SpeedStep
    [*]     Use ACPI tables to decode valid frequency/voltage pairs
    [*]     Built-in tables for Banias CPUs
    [ ]   Intel Speedstep on ICH-M chipsets (ioport interface)
    [ ]   Intel SpeedStep on 440BX/ZX/MX chipsets (SMI interface)
    [ ]   Intel Pentium 4 clock modulation
    [ ]   nVidia nForce2 FSB changing
    [ ]   Transmeta LongRun
```

how much memory?
```
Processor type and features
    High Memory Support
        ( ) off
        ( ) 4GB
        (x) 64GB


```


enable acpi
```

Power management options (ACPI, APM)
    ACPI (Advanced Configuration and Power Interface) Support
        [*] ACPI Support
There are a wide range of different ACPI "drivers" that control different types of ACPI devices. You should enable the specific ones that you have on your machine:

Power management options (ACPI, APM)
    ACPI (Advanced Configuration and Power Interface) Support
        [*] ACPI Support
        [*]   AC Adapter
        [*]   Battery
        [*]   Button
        [*]   Video
        [*]   Generic Hotkey
        [*]   Fan
        [*]   Processor
        [*]     Thermal Zone
        [ ]   ASUS/Medion Laptop Extras
        [*]   IBM ThinkPad Laptop Extras
        [ ]   Toshiba Laptop Extras
XXX: have a look at the configuration here in depth
```


## 4. Networking

```bash
Networking
    [*] Networking support

Networking
    [*] Networking support
          Networking options
              [*] TCP/IP networking
```


### Netfilter
used for instance for firewall
```bash

Networking
    [*] Networking support
          Networking options
              [*] Network packet filtering (replaces ipchains)

Networking
    [*] Networking support
          Networking options
              [*] Network packet filtering (replaces ipchains)
                    Core Netfilter Configuration
                        [*] Netfilter netlink interface
                        [*] Netfilter Xtables support (required for ip_tables)


XXX: different protocols to be selected here:
Networking
    [*] Networking support
          Networking options
              [*] Network packet filtering (replaces ipchains)
                    IP: Netfilter Configuration
                        [M] Connection tracking (required for masq/NAT)
                        [ ]   Connection tracking flow accounting
                        [ ]   Connection mark tracking support
                        [ ]   Connection tracking events (EXPERIMENTAL)
                        [ ]   SCTP protocol connection tracking support (EXPERIMENTAL)
                        [M]   FTP protocol support
                        [ ]   IRC protocol support
                        [ ]   NetBIOS name service protocol support (EXPERIMENTAL)
                        [M]   TFTP protocol support
                        [ ]   Amanda backup protocol support
                        [ ]   PPTP protocol support
                        [ ]   H.323 protocol support (EXPERIMENTAL)
```

```bash
Bus options (PCI, PCMCIA, EISA, MCA, ISA)
    [*] PCI Support
Enable basic network device support:

Device Drivers
    Network device support
        [*] Network device support
Then comes the fun task of finding the specific device drivers for your hardware. The most common place to find Ethernet devices for modern hardware is in the gigabit section of the driver selection:

Device Drivers
    Network device support
        [*] Network device support
            Ethernet (1000 Mbit)
```
bluetooth
```bash

Networking
    [*] Networking support
        --- Bluetooth subsystem support
        [*]   L2CAP protocol support
        [*]   SCO links support
There are relatively few individual Bluetooth devices drivers available, because almost all of these devices follow the Bluetooth specification detailing how devices should operate. The drivers marked in the following list must be selected in order for Bluetooth to work with the device:

Networking
    [*] Networking support
        --- Bluetooth subsystem support
            Bluetooth device drivers
                [M] HCI USB driver
                [*]   SCO (voice) support
                [ ] HCI UART driver
                [M] HCI BCM203x USB driver
                [M] HCI BPA10x USB driver
                [ ] HCI BlueFRITZ! USB driver
                [ ] HCI DTL1 (PC Card) driver
                [ ] HCI BT3C (PC Card) driver
                [ ] HCI BlueCard (PC Card) driver
                [ ] HCI UART (PC Card) device driver
                [ ] HCI VHCI (Virtual HCI device) driver
```

Wifi
```
Networking
    [*] Networking support
    [*]   Generic IEEE 802.11 Networking Stack
Also enable the different 802.11 protocol options, and the "Software MAC" option to provide full support for all different types of wireless devices in Linux:

Networking
    [*] Networking support
    [*]   Generic IEEE 802.11 Networking Stack
    [*]     IEEE 802.11 WEP encryption (802.1x)
    [M]     IEEE 802.11i CCMP support
    [M]     IEEE 802.11i TKIP encryption
    [M]     Software MAC add-on to the IEEE 802.11 networking stack
Support for the different PCI types of wireless network devices is found under the Network driver section of the configuration:

Device Drivers
    Network device support
        Wireless LAN (non-hamradio)
            [*] Wireless LAN drivers (non-hamradio) & Wireless Extensions
            [*]   Wireless Extension API over RtNetlink
```

## 5. FS
Noteworthy: RAID Support (not enabled for this pc)


select the general type:


```
File systems
    [ ] Second extended fs support
    [ ] The ext3 filesystem
    [x] The ext4 filesystem
    [x] use ext4 for ext2
    [x] ext4 security labels
    [x] ext4 encryption
    Pseudo Filesystem
        [x] proc file system support (all descendents)
        [x] tmpfs virtual memory filesystem support
```




## 5. Security

```
Security options
    [*] Enable different security models
    [*]   Default Linux Capabilities
```


```
SELinux also requires that audit be enabled in the kernel configuration. To do this:

General setup
    [*] Auditing support
Also, the networking security option must be enabled:

Security options
    [*] Enable different security models
    [*]   Socket and Networking Security Hooks
Now it is possible to select the SELinux option:

Security options
    [*] Enable different security models
    [*] NSA SELinux Support
There are also a number of individual SELinux options that you might wish to enable. Please see the help for the individual different items for more descriptions on what they do in.

Security options
    [*] Enable different security models
    [*] NSA SELinux Support
    [ ]   NSA SELinux boot parameter
    [ ]   NSA SELinux runtime disable
    [*]   NSA SELinux Development Support
    [*]   NSA SELinux AVC Statistics
    (1)   NSA SELinux checkreqprot default value

XXX: read on that one.
```
