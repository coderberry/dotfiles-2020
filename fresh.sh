#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# https://github.com/sindresorhus/quick-look-plugins
xattr -d -r com.apple.quarantine ~/Library/QuickLook

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install memcached imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/spark-installer laravel/valet beyondcode/expose

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Code directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Code

# Clone Github repositories
./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink .irbrc, .gemrc and .railsrc
ln -s $HOME/.dotfiles/.irbrc $HOME/.irbrc
ln -s $HOME/.dotfiles/.gemrc $HOME/.gemrc
ln -s $HOME/.dotfiles/.railsrc $HOME/.railsrc

# Symlink .mertrc
ln -s $HOME/.dotfiles/.mertrc $HOME/.mertrc

# Symlink .gitignore
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore

# Symlink .gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Symlink .tmux.conf
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink the bin folder
ln -s $HOME/.dotfiles/bin $HOME/.bin

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
