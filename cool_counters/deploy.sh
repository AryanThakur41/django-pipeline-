#!/bin/bash

# Define repository URL and target directory
REPO_URL="https://github.com/AryanThakur41/django-pipeline-.git"
TARGET_DIR="/home/ubuntu/simple-django-app"

# Clone the repository if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    git clone "$REPO_URL" "$TARGET_DIR"
else
    echo "Repository already cloned. Pulling the latest code..."
    cd "$TARGET_DIR" || { echo "Failed to navigate to target directory."; exit 1; }
    git pull origin main
fi

# Navigate to the application directory
cd "$TARGET_DIR/cool_counters" || { echo "Failed to navigate to application directory."; exit 1; }

# Create a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Upgrade pip and install required dependencies
pip install --upgrade pip
pip install -r requirements.txt || { echo "Failed to install requirements."; exit 1; }

# Collect static files
python3 manage.py collectstatic --noinput || { echo "Failed to collect static files."; exit 1; }

# Apply migrations
python3 manage.py migrate || { echo "Failed to apply migrations."; exit 1; }

# Restart Gunicorn or Django server
# Uncomment the line below if you are using Gunicorn with systemd
# sudo systemctl restart gunicorn || { echo "Failed to restart Gunicorn."; exit 1; }

# Run the Django development server
python3 manage.py runserver || { echo "Failed to start Django server."; exit 1; }
