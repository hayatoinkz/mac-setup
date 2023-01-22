# install xcode build tools

xcode-select --install

# install homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew formulae

xargs brew install < brew-formulae.txt

# install homebrew casks

xargs brew install < brew-casks.txt

# setup .zshrc and other dot files

cd ~

curl -O https://raw.githubusercontent.com/hayato-eth/mac-setup/main/src/zsh/.zshrc

curl -O https://github.com/hayato-eth/mac-setup/tree/main/src/.gitignore

# configure git

git config --global user.name "Vinicius Rocha"

git config --global user.email vinicius.workspace@gmail.com

git config --global core.editor vim

git config --global init.defaultBranch main

# install node version manager

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash

nvm install --lts

# global npm installs

npm install -g lite-server license gitignore yarn pnpm @angular/cli

# create dev folder

mkdir ~/Development