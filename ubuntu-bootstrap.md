# Package manager

```
sudo apt install -y apt-transport-https autoconf automake bison shellcheck build-essential ca-certificates make cmake curl direnv flex g++ gettext git gnome-tweak-tool gnupg-agent gnupg2 htop jq libfontconfig1-dev libfreetype6-dev libgif-dev libgmp-dev libgnutls28-dev libgtk2.0-dev libicu-dev libjansson-dev libjansson4 libjpeg-dev libncurses-dev libncurses5-dev libncursesw5-dev libpng-dev libssl-dev libtiff-dev libtinfo-dev libtool libtool-bin libx11-dev libxcb-xfixes0-dev libxpm-dev lynx mailutils meld mysql-client ncdu network-manager-openvpn network-manager-openvpn-gnome ninja-build openssh-server openvpn pandoc pkg-config python3 python3-pip ranger resolvconf software-properties-common stow taskwarrior tcpdump texinfo tig tlp unzip wmctrl xbacklight xclip xdotool zeal zsh dconf-tools rlwrap gcc pkg-config autoconf automake python3-docutils libseccomp-dev libjansson-dev libyaml-dev libxml2-dev
```

# From source
## neovim

```
git clone https://github.com/neovim/neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

### Python lib
`sudo -H pip3 install neovim`

### neovim remote

```
pip3 install neovim-remote
```

## cmake

Might not need this

```
  wget https://github.com/Kitware/CMake/releases/download/v3.18.1/cmake-3.18.1.tar.gz
  tar -xvf cmake-3.18.1.tar.gz
  ./bootstrap
  make
  sudo make install
```

## tmux

### Libevent

```
  ./autogen.sh
  ./configure
  make
  sudo make install
```

```
  ./configure
  make
  sudo make install
```

### tpm

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## alacritty

### rustup

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

```
rustup override set stable
rustup update stable
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```

## docker

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
sudo usermod -aG docker username
```

## docker-compose

```
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## go

```
wget https://golang.org/dl/go1.14.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.6.linux-amd64.tar.gz
```

### tools

```
go get golang.org/x/tools/gopls
go get github.com/jesseduffield/lazygit
```

## delta

```
wget https://github.com/dandavison/delta/releases/download/0.4.0/git-delta_0.4.0_amd64.deb
sudo dpkg -i git-delta_0.4.0_amd64.deb
```

## zoxide

```
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | sh
```

## ripgrep

```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

## fzf

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# Snaps

```
snap install spotify
snap install ccls --classic
```

# Node

```
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
```

Don't use sudo for npm
https://medium.com/@ExplosionPills/dont-use-sudo-with-npm-still-66e609f5f92

```
npm install -g typescript-language-server
```

## Bat

```
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb
sudo dpkg -i bat_0.15.4_amd64.deb
```

## Tig

wget https://github.com/jonas/tig/releases/download/tig-2.5.1/tig-2.5.1.tar.gz

## Ctags

```
./autogen.sh
./configure
make
sudo make install
```

# Keymaps

https://askubuntu.com/questions/885045/how-to-swap-ctrl-and-alt-keys-in-ubuntu-16-04
https://askubuntu.com/questions/1133312/how-do-i-remap-caps-lock-to-hyper-key-in-ubuntu-18-04
See copies of files in ./no-stow/keymaps

# Terminal colors

https://github.com/syl20bnr/spacemacs/wiki/Terminal

https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560
