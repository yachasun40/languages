#!/bin/bash

set -e

QUARTO_VERSION="1.10.15"

echo "====================================="
echo "Installing Quarto ${QUARTO_VERSION}"
echo "====================================="

# Comprueba si ya está instalada la versión correcta
if command -v quarto >/dev/null 2>&1; then
    INSTALLED_VERSION=$(quarto --version)

    if [ "$INSTALLED_VERSION" = "$QUARTO_VERSION" ]; then
        echo "Quarto ${QUARTO_VERSION} is already installed."
        exit 0
    fi
fi

cd /tmp

wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb

sudo dpkg -i quarto-${QUARTO_VERSION}-linux-amd64.deb

rm -f quarto-${QUARTO_VERSION}-linux-amd64.deb

echo
echo "====================================="
echo "Quarto installation completed"
echo "====================================="

quarto --version

quarto check

echo
echo "Environment ready!"