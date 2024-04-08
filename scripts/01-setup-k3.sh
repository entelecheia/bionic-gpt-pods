#! /bin/bash
## Server Node Installation
# --------------
## (Re-)install K3's

# Uninstall
# sudo /usr/local/bin/k3s-uninstall.sh

### 1. Install K3s
if ! command -v k3s &>/dev/null; then
    sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server --write-kubeconfig-mode="644"' sh -
    echo "K3s server installed and kubeconfig written."
fi
### 2. Update your kubeconfig
#
# This will copy over the K3s cube config and also set the correct IP address.
# This is useful if you want to use K9s for example.

if [ ! -f ~/.kube/config ]; then
    cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
    echo "Kubeconfig copied from K3s installation."
fi
sed -i "s,127.0.0.1,$(hostname -I | awk '{print $1}'),g" ~/.kube/config
echo "Kubeconfig updated with correct IP address."

### 3. Check your install
echo "Verifying Kubernetes installation..."
kubectl get pods
