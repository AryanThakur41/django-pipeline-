#!/bin/bash

if [ -d "django-pipeline-" ]; then
    cd django-pipeline- && git pull origin main
else
    git clone https://github.com/AryanThakur41/django-pipeline-
fi


cd /home/ubuntu/django-pipeline-

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
