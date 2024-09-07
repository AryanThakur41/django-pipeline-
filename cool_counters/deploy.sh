#!/bin/bash

# Clone the repository only if the directory doesn't exist
if [ ! -d "/home/ubuntu/django-pipeline-" ]; then
    git clone https://github.com/AryanThakur41/django-pipeline-.git
else
    echo "Directory already exists, skipping clone."
fi

# Navigate to the correct directory
cd /home/ubuntu/django-pipeline- || { echo "Failed to change directory"; exit 1; }

# Pull the latest code from the repository
git pull origin main || { echo "git pull failed"; exit 1; }

# Create a virtual environment if it doesn't exist
if [ ! -d "myenv" ]; then
    python3 -m venv myenv || { echo "Failed to create virtual environment"; exit 1; }
fi

# Activate the virtual environment
source myenv/bin/activate || { echo "Failed to activate virtual environment"; exit 1; }

# Install required dependencies
pip install -r ./cool_counters/requirements.txt || { echo "Failed to install requirements"; exit 1; }

# Apply migrations
python3 ./cool_counters/manage.py makemigrations || { echo "makemigrations failed"; exit 1; }
python3 ./cool_counters/manage.py migrate || { echo "migrate failed"; exit 1; }

# Run the Django development server in the background and log output to a file
echo "Running server"
nohup python3 ./cool_counters/manage.py runserver 0.0.0.0:8000 > server.log 2>&1 &
echo "Server started, logs available in server.log"
