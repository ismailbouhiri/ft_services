USER=$(whoami)

mkdir /goinfre/$USER
mkdir /goinfre/$USER/Homebrew
if [ -d "$HOME/Library/Caches/Homebrew" ]; then
	rm -rf $HOME/Library/Caches/Homebrew
fi
ln -s /goinfre/$USER/Homebrew $HOME/Library/Caches

rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/goinfre/ibouhiri/.brew && echo 'export PATH=$HOME/goinfre/ibouhiri/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update

brew install docker docker-machine minikube

mkdir /goinfre/$USER/.docker
if [ -d "$HOME/.docker" ]; then
	rm -rf $HOME/.docker
fi
ln -s /goinfre/$USER/.docker $HOME

mkdir /goinfre/$USER/.minikube
if [ -d "$HOME/.minikube" ]; then
	rm -rf $HOME/.minikube
fi
ln -s /goinfre/$USER/.minikube $HOME

mkdir /goinfre/$USER/.kube
if [ -d "$HOME/.kube" ]; then
	rm -rf $HOME/.kube
fi
ln -s /goinfre/$USER/.kube $HOME

mkdir /goinfre/$USER/VirtualBox
if [ -d "$HOME/Library/VirtualBox" ]; then
	rm -rf $HOME/Library/VirtualBox
fi
ln -s /goinfre/$USER/VirtualBox $HOME/Library/