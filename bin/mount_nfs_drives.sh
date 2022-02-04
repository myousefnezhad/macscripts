#!/bin/bash
# https://derflounder.wordpress.com/2020/01/18/creating-root-level-directories-and-symbolic-links-on-macos-catalina/
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA1  /DATA1
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA2  /DATA2
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA3  /DATA3
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA4  /DATA4
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA5  /DATA5
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA   /DATA
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA20 /DATA20
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA21 /DATA21
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA22 /DATA22
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA30 /DATA30
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA90 /DATA90
# sudo mount -o nolocks -t nfs 192.168.2.120:/DATA91 /DATA91
sudo mkdir /Volumes/DATA
sudo mount_smbfs //tony@192.168.2.120/DATA /Volumes/DATA
