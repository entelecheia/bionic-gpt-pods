#! /bin/bash
# Installing Bionic
## Step 0: Setup
#
# Before anything else, we need to ensure you have access to modern Kubernetes cluster
# and a functioning kubectl command on your local machine.
# (If you don’t already have a Kubernetes cluster,
# one easy option is to run one on your local machine.
# There are many ways to do this, including kind, k3d, Docker for Desktop, and more.)
#
# Validate your Kubernetes setup by running:

kubectl version

# The bionic installer simplifies a lot of the setup. To install it run the following.
## Step 1: Install the CLI

if ! command -v bionic &>/dev/null; then
    # ldconfig -n -v /usr/lib
    export LD_LIBRARY_PATH="/usr/lib:/usr/local/lib"
    curl -OL https://github.com/bionic-gpt/bionic-gpt/releases/latest/download/bionic-cli-linux && mkdir -p "$HOME/.bionic" && mv ./bionic-cli-linux "$HOME/.bionic/bionic" && chmod +x "$HOME/.bionic/bionic"
fi

# Be sure to follow the instructions to add it to your path:
# check if Path is already set
if [[ ":$PATH:" != *":$HOME/.bionic:"* ]]; then
    # echo 'export PATH=$HOME/.bionic:$PATH' >>~/.bashrc
    export PATH=$HOME/.bionic:$PATH
fi

# and export the path to the kubeconfig file.
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Check the installation

bionic -V
