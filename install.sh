#!/bin/sh

sudo apt-get install -y git vim a2jmidid autoconf base-passwd build-essential cabal-install compton compton-conf console-setup dash diffutils e2fsprogs feh findutils fonts-indic gimp-help-en grep gzip hostname htop hunspell-en-us hyphen-en-us i3status init libdebconfclient0 libev-dev libjack-jackd2-dev liblua5.1-0 liblua5.1-0-dev libluajit-5.1-2 libluajit-5.1-common libluajit-5.1-dev libpango1.0-dev libreoffice-help-en-us libsndfile1 libsndfile1-dev libstartup-notification0-dev libtool libxcb-cursor-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-util0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-xrm0 libxcb1-dev libxkbcommon-dev libxkbcommon-x11-dev libyajl-dev locales lua5.1 luajit mesa-common-dev mokutil multimedia-puredata mythes-en-us ncurses-base ncurses-bin patchage pciutils poppler-data rofi sc3-plugins scrot shim-signed spek supercollider-ide udev usbutils xoscope xutils-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake libxcb-shape0 libxcb-shape0-dev libxcb-xrm-dev libxcb-xrm0 apt-transport-https gpgv fonts-hack alsa-utils wget libgconf-2-4 libxkbfile1 xorg sakura nodm
mkdir temp
cd temp
git clone https://github.com/resloved/i3.git
cd i3
autoreconf --force --install
mkdir build
cd build
../configure
make
sudo make install
echo "exec /usr/local/bin/i3" >> ~/.xinitrc
chmod +x ~/.xinitrc

cd ~
git clone https://github.com/efairbanks/cybin.git
cd cybin
./LINUX_BUILD.SH
sudo dpkg --purge kxstudio-repos-gcc5
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
sudo dpkg -i kxstudio-repos_10.0.3_all.deb
sudo apt-get update
sudo apt-get -y install cadence catarina catia claudia carla

wget --output-document=atom.deb https://atom.io/download/deb
sudo dpkg -i atom.deb
sudo apt-get -y -f install
apm install tidalcycles supercollider language-supercollider cybin

cd ~/
mkdir ~/.bin
echo "export PATH=$PATH:`pwd`/.bin/" >> ~/.profile
echo "export PATH=$PATH:`pwd`/.bin/" >> ~/.bashrc
ln -s `pwd`/cybin/cybin `pwd`/.bin/cybin

mkdir ~/.config
mkdir ~/.config/i3
cp ./i3_config ~/.config/i3/config

sudo rm /etc/default/nodm
sudo touch /etc/default/nodm
echo "NODM_ENABLED=true" | sudo tee -a /etc/default/nodm
echo "NODM_USER=eris" | sudo tee -a /etc/default/nodm
echo "NODM_XSESSION=/home/eris/.xinitrc" | sudo tee -a /etc/default/nodm

startx
