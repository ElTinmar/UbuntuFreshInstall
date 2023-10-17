## UbuntuFreshInstall
```
sudo apt update & sudo apt upgrade
```
# apt

```
sudo apt install vim htop vlc inkscape ffmpeg texlive-full git \
  net-tools gimp pdftk ubuntu-restricted-extras openssh-server \
  build-essential checkinstall pkg-config libgtk-3-dev libxcb-cursor0 \
  pandoc nvtop gstreamer1.0-plugins-*
```

# snap / download deb / AppImage
mendeley

```
sudo snap install freecad bitwarden
```

# zotero

```
wget -O zotero.tar.bz2 'https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64'
tar -xvf zotero.tar.bz2 --directory ~/.local/
~/.local/Zotero_linux-x86_64/set_launcher_icon
ln -s ~/.local/Zotero_linux-x86_64/zotero.desktop ~/.local/share/applications/zotero.desktop
```

# zoom
```
wget -O zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom.deb
```

# Fiji
```
wget -O fiji.zip https://downloads.imagej.net/fiji/latest/fiji-linux64.zip
sudo unzip fiji.zip -d ~/.local/
```

# discord
```
wget -O discord.deb 'https://discord.com/api/download?platform=linux&format=deb'
sudo apt install ./discord.deb
```

# miniconda
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
```

# vscode
```
wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install ./vscode.deb
```

# nordvpn
```
sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh)
```

## configure
- thunderbird
- gedit 
- terminal
- vim
- htop
- keyboard shortcut for accents
- setup google account (calendar,...)
- add ssh key for github
