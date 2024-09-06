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
    # Try installing pip with apt first
    if sudo apt install -y python3-pip; then
        echo "pip installed: $(pip --version)"
    else
        # Fallback to get-pip.py if apt fails
        echo "pip is not available via apt. Installing pip using get-pip.py..."
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
        sudo python3 get-pip.py
        echo "pip installed: $(pip --version)"
    fi
fi

# Install python3-venv
echo "Installing python3-venv..."
sudo add-apt-repository universe
sudo apt install python3.12-venv
pip install virtualenv
virtualenv myenv
source myenv/bin/activate



# Check if python3-venv was installed successfully
if python3 -m venv --help &>/dev/null; then
    echo "python3-venv is installed."
else
    echo "python3-venv installation failed."
fi
