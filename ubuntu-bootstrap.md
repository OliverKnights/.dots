# Package manager

```
sudo apt install -y apt-transport-https autoconf automake bison shellcheck build-essential ca-certificates cmake curl direnv flex g++ gettext git gnome-tweak-tool gnupg-agent gnupg2 htop jq libfontconfig1-dev libfreetype6-dev libgif-dev libgmp-dev libgnutls28-dev libgtk2.0-dev libicu-dev libjansson-dev libjansson4 libjpeg-dev libncurses-dev libncurses5-dev libncursesw5-dev libpng-dev libssl-dev libtiff-dev libtinfo-dev libtool libtool-bin libx11-dev libxcb-xfixes0-dev libxpm-dev lynx mailutils meld mysql-client ncdu network-manager-openvpn network-manager-openvpn-gnome ninja-build openssh-server openvpn pandoc pkg-config python3 python3-pip ranger resolvconf software-properties-common stow taskwarrior tcpdump texinfo tig tlp unzip wmctrl xbacklight xclip xdotool zeal zsh dconf-tools rlwrap
```

# From source
## neovim

```
git clone https://github.com/neovim/neovim
  make
  sudo make install
  Python lib:
  sudo -H pip3 install neovim
```

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
```

## delta

```
wget https://github.com/dandavison/delta/releases/download/0.4.0/git-delta_0.4.0_amd64.deb
sudo dpkg -i git-delta_0.4.0_amd64.deb
```

## emacs

https://masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation

```
git clone https://git.savannah.gnu.org/git/emacs.git
git checkout feature/native-comp
sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa \
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test \
      && sudo apt-get update -y \
      && sudo apt-get install -y gcc-10 libgccjit0 libgccjit-10-dev
export CC="gcc-10"
./autogen.sh
./configure --with-nativecomp --with-mailutils
make -j4 && sudo make install
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
snap install node --classic --channel=8
```

# Node
```
sudo -H npm install -g typescript-language-server
```

# Keymaps

https://askubuntu.com/questions/885045/how-to-swap-ctrl-and-alt-keys-in-ubuntu-16-04

