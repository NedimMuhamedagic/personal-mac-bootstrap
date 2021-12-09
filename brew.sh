
!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Installing homebrew..."

# Install homebrew if needed
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/nedimovski/.zprofile

# eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
# brew update

# Upgrade any already-installed formulae.
# brew upgrade

# Add more brew repos
# brew tap homebrew/core
# brew tap homebrew/cask-cask
brew tap homebrew/cask-versions

# Install some nice commandline tools
brew install wget
brew install git
brew install zsh
brew install nvm

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# Install some developer tools
brew install --cask iterm2
brew install --cask insomnia
brew install --cask authy
brew install --cask visual-studio-code
brew install --cask docker
Brew install --cask android-studio

# Misc apps
brew install --cask spotify
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask slack
brew install --cask transmission

brew cleanup