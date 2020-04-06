#!/usr/bin/env bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

color_normal="\033[0m"; color_red="\033[0;31m"; color_green="\033[0;32m"; color_yellow="\033[0;33m"; color_blue="\033[0;34m";
function echoerr { echo "============================================" 1>&2; echo_red "ERROR: $*" 1>&2;  echo "============================================" 1>&2; }
function error_exit { echoerr "$1"; exit 1; }
function echo_green { echo -e "${color_green}$1${color_normal}"; }
function echo_red { echo -e "${color_red}$1${color_normal}"; }
function echo_yellow { echo -e "${color_yellow}$1${color_normal}"; }
function echo_blue { echo -e "${color_blue}$1${color_normal}"; }

echo_blue "Installing homebrew..."
if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || error_exit "Installing brew failed"
    echo_green "brew successfully installed (version: $(brew --version))"    
else 
    echo_yellow "brew is already installed (version: $(brew --version))"    
fi


echo
echo_blue "Installing minikube..."
if test ! $(which minikube); then
    brew install minikube || error_exit "Installing minikube failed"
    echo_green "minikube successfully installed (version: $(minikube version))"
else 
    echo_yellow "minikube is already installed (version: $(minikube version))"  
fi


echo
echo_blue "Installing kubectl..."
if test ! $(which kubectl); then
    brew install kubectl || error_exit "Installing kubectl failed"
    echo_green "kubectl successfully installed (version: $(kubectl version))"
else 
    echo_yellow "kubectl is already installed (version: $(kubectl version))"  
fi


echo
echo_blue "Installing helm ..."
if test ! $(which helm); then
    brew install kubernetes-helm || error_exit "Installing helm failed"
    echo_green "helm successfully installed (version: $(helm version))"
else 
    echo_yellow "helm is already installed (version: $(helm version))"  
fi


echo
echo_blue "Installing draft..."
if test ! $(which draft); then
    brew install azure/draft/draft || error_exit "Installing draft failed"
    echo_green "draft successfully installed (version: $(draft version))"
    
    echo
    echo_blue "Initiallising draft"
    draft init || error_exit "Initializing draft failed"
    echo_green "draft successfully initialised"
else 
    echo_yellow "draft is already installed (version: $(draft version))"  
fi
