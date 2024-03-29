sudo apt update & sudo apt upgrade
sudo apt install vim htop vlc inkscape ffmpeg texlive-full git \
  net-tools gimp pdftk ubuntu-restricted-extras openssh-server \
  build-essential checkinstall pkg-config libgtk-3-dev libxcb-cursor0 \
  gparted pandoc nvtop gstreamer1.0-plugins-*
mkdir ~/.local/bin

# bitwarden
sudo snap install bitwarden

# freecad
sudo snap install freecad
sudo snap connect freecad:removable-media

# slack
sudo snap install slack

# zotero
wget -O zotero.tar.bz2 'https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64'
tar -xvf zotero.tar.bz2 --directory ~/.local/
~/.local/Zotero_linux-x86_64/set_launcher_icon
ln -s ~/.local/Zotero_linux-x86_64/zotero.desktop ~/.local/share/applications/zotero.desktop
rm zotero.tar.bz2

# zoom
wget -O zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom.deb
rm zoom.deb

# Fiji
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

# discord 
wget -O discord.deb 'https://discord.com/api/download?platform=linux&format=deb'
sudo apt install ./discord.deb
rm discord.deb

# miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh

# vscode
wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install ./vscode.deb
rm vscode.deb

 # nordvpn
 sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh)
 
# docker
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

