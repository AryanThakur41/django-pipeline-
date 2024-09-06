#!/bin/bash

git clone https://github.com/AryanThakur41/django-pipeline-.git

cd /home/ubuntu/simple-django-app/cool_counters

# Pull the latest code from the repository
git pull origin main

# Create a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install required dependencies
pip install -r ./cool_counters/requirements.tx

# Collect static files
python3 manage.py collectstatic --noinput

# Apply migrations
python3 manage.py migrate

# Restart Gunicorn or Django server
# sudo systemctl restart gunicorn
python3 manage.py runserver 
