#!/bin/bash
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
brew install blueutil tmux watch tree jq telnet
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

brew install bbr
brew install p-automator
brew install cloudfoundry/tap/bbl
brew install azure-cli
brew upgrade kubernetes-cli
brew install tftp
brew install go
brew tap pivotal/tap
brew install gemfire
brew install mvn
brew install kubeadm
brew install helm
brew install argocd
brew install kctrl
brew install k9s
brew install psql
brew install nodejs
brew install npm
brew install mkdocs
brew install psql
brew install postgresql
brew tap pivotal-cf/om https://github.com/pivotal-cf/om
brew install om
brew cleanup
wget -O- https://carvel.dev/install.sh > install.sh
sudo bash install.sh














mas install 803453959 1020812363
gem install cf-uaac

# install fly-cli #
cd ~/Downloads
fly_type=fly_darwin_amd64$
curl -L --remote-name $(curl -s https://api.github.com/repos/concourse/concourse/releases/latest | jq -r ".assets[] | select(.name | test(\"${fly_type}\")) | .browser_download_url")
chmod +x fly_darwin_amd64
mv fly_darwin_amd64 /usr/local/bin/fly



# install oh-my-zsh (drops you into zsh and you must exit)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

