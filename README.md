# linux-cfg
Configuration files for Arch Linux system. The root of this project is assumed to be `/` directory.

## Used Essential Programs
I don't remember anymore which of these programs come installed in a basic Arch Linux installation. So I just list them.

### Display
* Xorg as display server
* Openbox as window manager
* Compton as tiling manager
* xorg-xinit for environment creation

In the current system, one logs in into the system in a virtual terminal. Then, running `startx` opens the graphic
environment. The starting keyboard layout is set by `/etc/X11/xorg.conf.d/00-keyboard.conf` file. Set your layout to
this file. Later, you can use programs such as `qxkb` to change layouts freely.

### General System Management
* systemd is a fantastic tool. It can be used for lots of stuff including journaling, logging, daemon manager, cron
replacement, etc. You most definitely need to get familiar with it.
  * In Arch Wiki, the terms `start`, `enable` and `disable` are frequently used. These refer to `systemctl start`,
  `systemctl enable` and `systemctl disable` commands. They are used to do those things to particular services/timers.

### Terminal
* There are many options. I like the recent `alacritty`. It is a GPU-accelerated terminal emulator and indeed quite fast
and smooth from my experience. I already provide a somewhat decent looking alacritty config. If you choose a different
one, you need to configure it to make it look acceptable.
* You most likely want a terminal multiplexer as well. I prefer `tmux`.

### Shell
* I use zsh. It is basically a more capable and enjoyable bash for my use cases. If you use zsh, you most likely need to
install oh-my-zsh as well to get a bunch of extra plugins and themes that you can choose. Especially useful plugins are
git and vim plugins; the rest might slow down your terminal.

### Copy-Pasting
* Install `xclip`. You can cat stuff into it to copy it to clipboard, and do the converse.

### Power Saving
* Install `cpupower`. See how it should be set up in `https://wiki.archlinux.org/index.php/CPU_frequency_scaling`.
* `acpi` for battery and temperature monitoring.

### Firewall
* Dealing with iptables rules manually can be daunting if you don't have the necessary knowledge. `ufw` is a
simple-to-use program that allows you to set up a decent firewall with a couple of commands.

### Security
* `rkhunter` for scanning.
* You can and probably should also install `clamav` for extra protection.
* Check Arch Wiki security page. There are links to more stuff.

### Nvidia + Intel GPU System
* You need to install proprietary Nvidia drivers. In general they are faster than alternatives like nouveau.
* If you have two GPUs on a laptop, you must install bumblebee and bbswitch packages. Otherwise, Nvidia GPU will never
turn off and you will eat up your battery much quicker. They may require extra steps for enabling. Check their Arch Wiki
pages.
* In general check power saving page in Arch Wiki if you have a laptop.

### ntfs-3g
* If you need to talk to NTFS formatted drives used by Windows systems, you need the `ntfs-3g` driver.

### Networking
* Install network-manager and applet. Managing wireless networks is quite easy with these two.

### File Manager
* Just pick one from Arch Wiki if you want to use one.
