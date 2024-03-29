# install chrome #
#cd ~/Downloads
#curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o googlechrome.dmg
#open ~/Downloads/googlechrome.dmg
#sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/

# install zoom #
#cd ~/Downloads
#curl -L --remote-name https://zoom.us/client/latest/zoomusInstaller.pkg
#sudo installer -pkg zoomusInstaller.pkg -target /

# install homebrew #
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install apps from homebrew #
#brew install blueutil tmux watch tree jq
##brew install minio/stable/mc
#brew install cloudfoundry/tap/credhub-cli
#brew install cloudfoundry/tap/bosh-cli
#brew install cloudfoundry/tap/cf-cli
#brew install homebrew/cask/powershell
##brew cask install iterm2
##brew install zsh
#brew install mas
##mas install 715768417 803453959
#gem install cf-uaac

# install fly-cli #
cd ~/Downloads
fly_type=fly_darwin_amd64$
curl -L --remote-name $(curl -s https://api.github.com/repos/concourse/concourse/releases/latest | jq -r ".assets[] | select(.name | test(\"${fly_type}\")) | .browser_download_url")
chmod +x fly_darwin_amd64
mv fly_darwin_amd64 /usr/local/bin/fly

# install vscode #
#cd ~/Downloads
#curl -o VSCode-darwin-stable.zip -L --remote-name https://go.microsoft.com/fwlink/?LinkID=620882
#cd /Applications
#unzip ~/Downloads/VSCode-darwin-stable.zip

# install oh-my-zsh (drops you into zsh and you must exit)
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#om-darwin
#cd ~/Downloads
#om_type=darwin
#curl -L --remote-name $(curl -s https://api.github.com/repos/pivotal-cf/om/releases/latest | jq -r ".assets[] | select(.name | test(\"${om_type}\")) | .browser_download_url")
#chmod +x om-darwin
#mv om-darwin /usr/local/bin/om

# due to great reluctance, I'm allowing concourse to be installed #
#cd ~/Downloads
#concourse_type=concourse_darwin_amd64$
#curl -L --remote-name $(curl -s https://api.github.com/repos/concourse/concourse/releases/latest | jq -r ".assets[] | select(.name | test(\"${concourse_type}\")) | .browser_download_url")
#chmod +x concourse_darwin_amd64
#mv concourse_darwin_amd64 /usr/local/bin/concourse
