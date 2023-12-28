#!/bin/bash
apt-get update
apt-get install -y \
  build-essential \
  procps \
  curl \
  file \
  wget \
  unzip \
  python3-venv \
  git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1
brew tap wez/wezterm-linuxbrew
brew install \
  neovim \
  wezterm \
  fish \
  lf \
  starship \
  fd \
  fzf \
  ripgrep
# go
wget -q https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
rm -rf /usr/local/go \
  && tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz \
  && rm go1.21.5.linux-amd64.tar.gz
export PATH=/usr/local/go/bin:$PATH
# node
wget -q https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-x64.tar.xz
rm -rf /usr/local/node \
  && mkdir /usr/local/node \
  && tar -C /usr/local --strip-components=1 -xf node-v20.10.0-linux-x64.tar.xz \
  && rm node-v20.10.0-linux-x64.tar.xz
export PATH=/usr/local/node/bin:$PATH
# rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
# neovim
git clone https://github.com/amiorin/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
nvim --headless "+Lazy! sync" +qa
