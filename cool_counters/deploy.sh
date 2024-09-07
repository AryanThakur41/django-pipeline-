#!/bin/bash

git clone https://github.com/AryanThakur41/django-pipeline-

cd /home/ubuntu/django-pipeline-

# Pull the latest code from the repository
git pull origin main

# Create a virtual environment if it doesn't exist
if [ ! -d "myenv" ]; then
    python3 -m venv myenv
fi

# Activate the virtual environment
source myenv/bin/activate

# Install required dependencies
pip install -r ./cool_counters/requirements.txt

# Collect static files
# python3 ./cool_counters/manage.py collectstatic --noinput

# Apply migrations
python3 ./cool_counters/manage.py migrate

# Restart Gunicorn or Django server
# sudo systemctl restart gunicorn
echo "runnig server"
python3 ./cool_counters/manage.py runserver 0.0.0.0:8000 &
