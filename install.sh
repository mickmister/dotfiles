# Symlinks
source $HOME/code/dotfiles/symlinks.sh


# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash


# Run these to set up .zshrc this in ~/.bash_profile:
echo 'export SHELL=$(which zsh)' >> ~/.bash_profile
echo 'exec $(which zsh) -l' >> ~/.bash_profile

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-history-substring-search zsh-autosuggestions

# Initialize zsh shell
source $HOME/.zshrc
