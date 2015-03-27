# homebrew
ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)"

# update homebrew
brew update
brew upgrade

# utils
brew install git
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --default-names
brew install wget --enable-iri
brew install golang

# macos x utils
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# cask
brew install caskroom/cask/brew-cask

# add formulae to homebrew
brew tap homebrew/science                       # science
brew tap caskroom/fonts                         # fonts
brew tap caskroom/versions

# langs
brew install python                                         # python

# remove outdated versions from the cellar
brew cleanup

# browsers
brew cask install firefox 2> /dev/null
brew cask install google-chrome 2> /dev/null

# dev apps
brew cask install iterm2 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install vagrant 2> /dev/null

# apps
brew cask install caffeine 2> /dev/null
brew cask install vlc 2> /dev/null
brew cask install shiftit 2> /dev/null
brew cask install dashlane 2> /dev/null
brew cask install transmission 2> /dev/null
brew cask install vlc 2> /dev/null
brew cask install evernote 2> /dev/null
brew cask install spotify 2> /dev/null
brew cask install slack 2> /dev/null
brew cask install telegram 2> /dev/null
brew cask install transmit 2> /dev/null
brew cask install robomongo 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install goofy 2> /dev/null
brew cask install mysqlworkbench 2> /dev/null
brew cask install robomongo 2> /dev/null
brew cask install dash 2> /dev/null
brew cask install boot2docker 2> /dev/null


# quick look
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch
quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r

# fonts
brew cask install font-source-code-pro 2> /dev/null


# front-end related stuff
gem install compass

# symlink .files
ln -s .vimrc ~/.vimrc
ln -s .zshrc ~/.zshrc
ln -s .osx ~/.osx
ln -s .gitconfig ~/.gitconfig
ln -s .gitignore ~/.gitignore

# Run installers
cd "$HOME/.dotfiles/$(dirname $)"/..
find . -name setup.sh | while read installer ; do sh -c "${installer}" ; done

