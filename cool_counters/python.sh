#!/bin/bash

# Check if Python is installed
if command -v python3 &>/dev/null; then
    echo "Python is already installed: $(python3 --version)"
else
    echo "Python is not installed. Installing Python..."
    sudo apt update
    sudo apt install -y python3
    echo "Python installed: $(python3 --version)"
fi

# Check if pip is installed
if command -v pip &>/dev/null; then
    echo "pip is already installed: $(pip --version)"
else
    echo "pip is not installed. Installing pip..."
    sudo apt install -y python3-pip
    echo "pip installed: $(pip --version)"
fi
sudo su
sudo apt install python3.12-venv -y
