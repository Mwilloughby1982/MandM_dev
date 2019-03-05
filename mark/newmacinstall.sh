#!/bin/bash
# check to see if atom is installed #
FILE=/Applications/Atom.app     
if [ -d $FILE ]; then
   echo "File $FILE exists."
else
   echo "File $FILE does not exist."
   exit 1
fi

# Install Atom Packages #
apm install split-diff
apm install script
apm install minimap
apm install minimap-split-diff
apm install minimap-highlight-selected
apm install highlight-selected
apm install atom-beautify
apm install Sublime-Style-Column-Selection


# create the .SSH symbolic link #
FILE=/Users/markwilloughby/Desktop/Keys     
if [ -d $FILE ]; then
   echo "File $FILE exists."
   ln -s ~/Desktop/Keys/.ssh ~/.ssh
   chmod 400 ~/.ssh/*.pem
else
   echo "File $FILE does not exist."
fi





# install chrome #
cd ~/Downloads
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o googlechrome.dmg
open ~/Downloads/googlechrome.dmg
sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/

# install zoom #
cd ~/Downloads
curl -L --remote-name https://zoom.us/client/latest/zoomusInstaller.pkg
sudo installer -pkg zoomusInstaller.pkg -target /

# install homebrew #
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install apps from homebrew #
brew update
brew upgrade
brew install blueutil tmux watch tree jq
brew install minio/stable/mc
brew install cloudfoundry/tap/credhub-cli
brew install cloudfoundry/tap/bosh-cli
brew install cloudfoundry/tap/cf-cli
brew install homebrew/cask/powershell
brew cask install iterm2
brew install zsh
brew install mas

brew install python3
brew install python-dev3 python-pip3 python-virtualenv libsasl2-dev python-dev libldap2-dev libssl-dev default-libmysqlclient-dev
brew install dig
brew xcode-select --install
brew install direnv
brew install terraform
brew install wget aws-cli

mas install 715768417 803453959 595191960 497799835 408981434 405399194
gem install cf-uaac

# install fly-cli #
cd ~/Downloads
fly_type=fly_darwin_amd64$
curl -L --remote-name $(curl -s https://api.github.com/repos/concourse/concourse/releases/latest | jq -r ".assets[] | select(.name | test(\"${fly_type}\")) | .browser_download_url")
chmod +x fly_darwin_amd64
mv fly_darwin_amd64 /usr/local/bin/fly

# install vscode #
cd ~/Downloads
curl -o VSCode-darwin-stable.zip -L --remote-name https://go.microsoft.com/fwlink/?LinkID=620882
cd /Applications
unzip ~/Downloads/VSCode-darwin-stable.zip

# install oh-my-zsh (drops you into zsh and you must exit)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

