## UbuntuFreshInstall
```
sudo apt update & sudo apt upgrade
```
# apt

```
sudo apt install vim htop vlc inkscape ffmpeg blender texlive-full git \
  net-tools gimp pdftk ubuntu-restricted-extras openssh-server libfuse2 \
  build-essential checkinstall pkg-config libgtk-3-dev libxcb-cursor0 \
  gparted pandoc nvtop wget curl cifs-utils gstreamer1.0-plugins-* \
  mplayer ocrmypdf system-config-printer
```

# prepare .local directory to store programs

```
mkdir ~/.local/bin
```

# snap / download deb / AppImage
mendeley

```
sudo snap install freecad bitwarden
sudo snap connect bitwarden:password-manager-service
sudo snap connect freecad:removable-media
sudo snap install slack
```

# zotero

```
wget -O zotero.tar.bz2 'https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64'
tar -xvf zotero.tar.bz2 --directory ~/.local/
~/.local/Zotero_linux-x86_64/set_launcher_icon
ln -s ~/.local/Zotero_linux-x86_64/zotero.desktop ~/.local/share/applications/zotero.desktop
rm zotero.tar.bz2
```

# zoom
```
wget -O zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom.deb
rm zoom.deb
```

# Fiji
```
wget -O fiji.zip https://downloads.imagej.net/fiji/latest/fiji-linux64.zip
unzip fiji.zip -d ~/.local/
rm fiji.zip

echo "[Desktop Entry]
Name=Fiji
GenericName=Fiji
X-GNOME-FullName=Fiji
Comment=Scientific Image Analysis
Type=Application
Categories=Education;Science;ImageProcessing;
Exec=${HOME}/.local/Fiji.app/ImageJ-linux64 %F
TryExec=${HOME}/.local/Fiji.app/ImageJ-linux64
Terminal=false
StartupNotify=true
MimeType=image/*;
Icon=${HOME}/.local/Fiji.app/images/icon.png
StartupWMClass=net-imagej-launcher-ClassLauncher
" > ~/.local/share/applications/Fiji.desktop

ln -s ~/.local/Fiji.app/ImageJ-linux64 ~/.local/bin/fiji
```

# discord
```
wget -O discord.deb 'https://discord.com/api/download?platform=linux&format=deb'
sudo apt install ./discord.deb
rm discord.deb
```

# miniconda
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh
```

Answer "yes" to alter .bashrc

Use mamba solver by default 

```
conda update -n base conda
conda install -n base conda-libmamba-solver
conda config --set solver libmamba
```

# Docker

Add Docker's official GPG key:
```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Add the repository to Apt sources:
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

Install 
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

# vscode
```
wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install ./vscode.deb
rm vscode.deb
```

# nordvpn
```
sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh)
```

reboot computer 

```
nordvpn login
```
# Prusa Slicer 

```
curl -s https://api.github.com/repos/prusa3d/PrusaSlicer/releases/latest | grep "browser_download_url.*x64-GTK3.*AppImage" | cut -d : -f 2,3 | tr -d \" | wget -O ~/.local/bin/PrusaSlicer.AppImage -qi -
cd ~/.local
mkdir PrusaSlicer
cd bin
chmod +x PrusaSlicer.AppImage
./PrusaSlicer.AppImage --appimage-extract
cd squashfs-root
cp PrusaSlicer.png ~/.local/PrusaSlicer/PrusaSlicer.png
sed -i 's!Exec=prusa-slicer %F!Exec=/home/martin/.local/bin/PrusaSlicer.AppImage!g' PrusaSlicer.desktop
sed -i 's!Icon=PrusaSlicer!Icon=/home/martin/.local/PrusaSlicer/PrusaSlicer.png!g' PrusaSlicer.desktop
cp PrusaSlicer.desktop ~/.local/share/applications/
cd ~/.local/bin/
rm -r squashfs-root
```

# Freecad AppImage (snap doesn't support spacemouse out of the box)
```
curl -s https://api.github.com/repos/FreeCAD/FreeCAD/releases/latest | grep -m 1 "browser_download_url.*x86_64.AppImage" | cut -d : -f 2,3 | tr -d \" | wget -O ~/.local/bin/FreeCAD.AppImage -qi -
cd ~/.local
chmod +x FreeCAD.AppImage
```

# spacenavd

Install from github

```
git clone https://github.com/FreeSpacenav/spacenavd.git
cd spacenavd
./configure
make
sudo make install
```

```
sudo cp contrib/spacenavd.service /etc/systemd/system/spacenavd.service
```

Edit /etc/systemd/system/spacenavd.service under the [Service] section
```
Environment=XAUTHORITY=/run/user/1000/gdm/Xauthority
Environment=DISPLAY=:1
```
# Arduino IDE

The arduino package in Ubuntu repositories is outdated. Download directly from github instead 

```
curl -s https://api.github.com/repos/arduino/arduino-ide/releases/latest | grep "browser_download_url.*Linux_64bit.*AppImage" | cut -d : -f 2,3 | tr -d \" | wget -O ~/.local/bin/Arduino.AppImage -qi -
cd ~/.local/bin
chmod +x Arduino.AppImage
```

## configure
- thunderbird
- gedit 
- terminal : dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
- vim
- htop : mv htoprc ~/.config/htop/htoprc
- keyboard shortcut for accents
- setup google account (calendar,...)
- In case of dual boot with Windows, make Ubuntu use local time for hardware clock: timedatectl set-local-rtc 1

# add ssh key for github

```
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/github
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
```

add public key to github

```
cat ~/.ssh/github.pub
```
configure git:
```
git config --edit --global
```

