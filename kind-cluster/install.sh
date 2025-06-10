#!/bin/bash

# Install kind for AMD64 / x86_64
if [ "$(uname -m)" = "x86_64" ]; then
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.29.0/kind-linux-amd64
  chmod +x ./kind
  sudo cp ./kind /usr/local/bin/kind
  rm -f ./kind
else
  echo "Unsupported architecture: $(uname -m)"
  exit 1
fi

# Install latest stable kubectl
VERSION=$(curl -sSL https://dl.k8s.io/release/stable.txt)
URL="https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl"
INSTALL_DIR="/usr/local/bin"

curl -LO "$URL"
chmod +x kubectl
sudo mv kubectl $INSTALL_DIR/
kubectl version --client

echo "kind & kubectl installation complete."
