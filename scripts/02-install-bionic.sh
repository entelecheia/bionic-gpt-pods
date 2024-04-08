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
    # export LD_LIBRARY_PATH="/usr/lib:/usr/local/lib"
    curl -OL https://github.com/bionic-gpt/bionic-gpt/releases/latest/download/bionic-cli-linux && mkdir -p "$HOME/.bionic" && mv ./bionic-cli-linux "$HOME/.bionic/bionic" && chmod +x "$HOME/.bionic/bionic"
fi

# Be sure to follow the instructions to add it to your path:
# check if Path is already set
if [[ ":$PATH:" != *":$HOME/.bionic:"* ]]; then
    echo 'export PATH=$HOME/.bionic:$PATH' >>~/.zshrc
    source ~/.zshrc
    # export PATH=$HOME/.bionic:$PATH
fi

# and export the path to the kubeconfig file.
if [[ -z "$KUBECONFIG" ]]; then
    echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >>~/.zshrc
    source ~/.zshrc
fi

# Check the installation

bionic -V
## Step 2: Run the Install

# The following will install $(k3s) as our kubernetes engine and then install bionic into the cluster.
# It will also install $(k9s) which is a terminal UI for Kubernetes.

bionic install
## Step 3: The Finished Result

# You can install [k9s](https://k9scli.io/) which is a great way to get insight into your cluster.

if ! command -v k9s &>/dev/null; then
    curl -L -s https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz | tar xvz -C /tmp && sudo mv /tmp/k9s /usr/local/bin && rm -rf k9s_Linux_amd64.tar.gz
fi

# and then.

k9s

# After a while of container creation you should see all the pods running and then be able to access Bionic.

## Step 4: Run the User Interface

# You can then access the front end from `http://{YOUR_IP_ADDRESS}`
# and you'll be redirected to a registration screen.

# To get your ip address

hostname -I | awk '{print $1}'

## Step 5: Registration

# The first user to register with **BionicGPT** will become the system administrator.
# The information is kept local to your machine and your data is not sent anywhere.
