#!/bin/bash

# Define repository URL and target directory
REPO_URL="https://github.com/AryanThakur41/django-pipeline-.git"
TARGET_DIR="/home/ubuntu/simple-django-app"
APP_DIR="$TARGET_DIR/cool_counters"

# Check if the target directory exists and has proper permissions
if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory does not exist. Creating directory..."
    sudo mkdir -p "$TARGET_DIR" || { echo "Failed to create target directory."; exit 1; }
    sudo chown $(whoami):$(whoami) "$TARGET_DIR" || { echo "Failed to change ownership of target directory."; exit 1; }
fi

# Clone the repository if it doesn't exist
if [ ! -d "$APP_DIR" ]; then
    git clone "$REPO_URL" "$APP_DIR" || { echo "Failed to clone repository."; exit 1; }
else
    echo "Repository already cloned. Pulling the latest code..."
    cd "$APP_DIR" || { echo "Failed to navigate to application directory."; exit 1; }
    git pull origin main || { echo "Failed to pull latest code."; exit 1; }
fi

# Navigate to the application directory
cd "$APP_DIR" || { echo "Failed to navigate to application directory."; exit 1; }

# Create a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv || { echo "Failed to create virtual environment."; exit 1; }
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
