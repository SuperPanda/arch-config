# arch-config

## Get list of vim dependencies
```
cd ~/.vim/pack/bundle/start
find -name .git -print -execdir git --git-dir={}/ --work-tree=$PWD/{} remote show origin \; > /tmp/vimbundles.tmp
grep Fetch /tmp/vimbundles.tmp | cut -c 14-  > ~/repo/arch-config/vim-packages.txt
```

## Get list of packages
```
pacman -Qe > ~/repo/arch-config/package_list.txt
```

## Things to consider
- sshd and ssh
- kvm
- tinyssh initramfs
- setup up the /home/build environment
- port forwarding, dhcp
- ddns
- wpa_supplicant auto connect

## Building AUR packages
Setup the nobody build directory:
```
mkdir /home/build
chgrp nobody /home/build
chmod g+ws /home/build
setfacl -m u::rwx,g::rwx /home/build
setfacl -d --set u::rwx,g::rwx,o::- /home/build
```
Clone the repo in /hone/build, then it can be built using:
```
sudo -u nobody makepkg
pacman -U <the-package.tar.xz>
```

## TODO
- ddns / reverse-ssh + auto-connect to net with dhcp without timing out if its not connected
- rsync usbs
- hdmi audio
