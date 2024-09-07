#!/bin/bash

# Clone the repository only if the directory doesn't exist
if [ ! -d "/home/ubuntu/django-pipeline-" ]; then
    git clone https://github.com/AryanThakur41/django-pipeline-.git
else
    echo "Directory already exists, skipping clone."
fi

# Correct the path (remove the trailing '-')
#sudo chown -R ubuntu:ubuntu /home/ubuntu/django-pipeline-
#sudo chmod -R 755 /home/ubuntu/django-pipeline-

# Navigate to the correct directory
#cd /home/ubuntu/django-pipeline- || exit 1

# Pull the latest code from the repository
#git pull origin main

# Create a virtual environment if it doesn't exist
#if [ ! -d "myenv" ]; then
#    python3 -m venv myenv
#fi

# Activate the virtual environment
#source myenv/bin/activate

# Install required dependencies
#pip install -r ./cool_counters/requirements.txt

# Apply migrations
#python3 ./cool_counters/manage.py makemigrations
#python3 ./cool_counters/manage.py migrate

# Restart Gunicorn or Django server (skipped here)
# sudo systemctl restart gunicorn

# Run the Django development server in the background
#echo "Running server"
#python3 ./cool_counters/manage.py runserver 0.0.0.0:8000 &
