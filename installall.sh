#!/bin/bash

USER=$(whoami)
DOCKER_DIR=/goinfre/$USER/.docker
MINIKUBE_DIR=/goinfre/$USER/.minikube
KUBE_DIR=/goinfre/$USER/.kube
VBOX_DIR=/goinfre/$USER/VirtualBox
HOMEBREW_CACHE=/goinfre/$USER/Homebrew

echo "installing brew..."
mkdir $HOMEBREW_CACHE
if [ -d "$HOME/Library/Caches/Homebrew" ]; then
	rm -rf $HOME/Library/Caches/Homebrew
fi
ln -s $HOMEBREW_CACHE $HOME/Library/Caches

rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/goinfre/ibouhiri/.brew && echo 'export PATH=$HOME/goinfre/ibouhiri/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update

echo "Installing docker, docker-machine and minikube"
brew install docker docker-machine minikube

# make .minikube .docker .kube VIrtualBox dirs

mkdir $DOCKER_DIR
if [ -d "$HOME/.docker" ]; then
	rm -rf $HOME/.docker
fi
ln -s $DOCKER_DIR $HOME

mkdir $MINIKUBE_DIR
if [ -d "$HOME/.minikube" ]; then
	rm -rf $HOME/.minikube
fi
ln -s $MINIKUBE_DIR $HOME

mkdir $KUBE_DIR
if [ -d "$HOME/.kube" ]; then
	rm -rf $HOME/.kube
fi
ln -s $KUBE_DIR $HOME

mkdir $VBOX_DIR
if [ -d "$HOME/Library/VirtualBox" ]; then
	rm -rf $HOME/Library/VirtualBox
fi
ln -s $VBOX_DIR $HOME/Library/

# add to .zshrc o .bashrc
#export PATH=/goinfre/$USER/.brew/bin:$PATH


#source /goinfre/$USER/.brew/etc/bash_completion.d/docker-machine-prompt.bash
#PS1="\[\033[1;31m\]\u@\h\[\033[37m\]:\[\033[34m\]\w$(__docker_machine_ps1)\[\033[0;37m\]\$ "


# echo "Starting docker-machine"
# docker-machine create --driver=virtualbox default
# eval $(docker-machine env)

# echo "Starting minikube"
# minikube start
# eval $(minikube -p minikube docker-env)