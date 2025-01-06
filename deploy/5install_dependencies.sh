#!/bin/bash
# File: 5install_dependencies.sh
# Description: Install all dependencies for the HelloJob project
# Function: Create necessary directories, generate package.json, and install dependencies

echo "🔧 Installing dependencies for the HelloJob project..."

TOTAL_STEPS=8
CURRENT_STEP=0
ERROR_LOG=()

run_command() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    echo "Running: $1"
    eval "$1"
    if [ $? -eq 0 ]; then
        PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))
        echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Completed - Progress: $PERCENT%"
    else
        PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))
        echo "❌ [$CURRENT_STEP/$TOTAL_STEPS] Failed - $1"
        ERROR_LOG+=("$1")
    fi
}

check_node() {
    if ! command -v node &> /dev/null
    then
        echo "❌ Node.js is not installed. Please install it from https://nodejs.org/"
        exit 1
    else
        echo "✅ Node.js is installed. Version: $(node -v)"
    fi
}

check_npm() {
    if ! command -v npm &> /dev/null
    then
        echo "❌ npm is not installed. Please install it from https://nodejs.org/"
        exit 1
    else
        echo "✅ npm is installed. Version: $(npm -v)"
    fi
}

create_base_structure() {
    for dir in backend frontend/client-app frontend/professional-app frontend/admin-panel frontend/support-panel; do
        if [ ! -d "$dir" ]; then
            echo "📂 Creating directory: $dir"
            mkdir -p "$dir"
        fi

        # Create package.json with valid content
        if [ ! -f "$dir/package.json" ]; then
            echo "📄 Creating package.json for $dir"
            cat <<EOL > $dir/package.json
{
  "name": "$(basename $dir)",
  "version": "1.0.0",
  "description": "Generated package.json for $(basename $dir)",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  }
}
EOL
        fi
    done
    echo "✅ Project structure and package.json files verified."
}

create_backend_env() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    if [ ! -d "backend/database" ]; then
        mkdir -p backend/database
    fi

    cat <<EOL > backend/.env
# Environment Variables
PORT=3000
JWT_SECRET=changeme
DATABASE_URL=sqlite://backend/database/hellojob.db
EOL
    PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))
    echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Backend .env file created."
}

# Run structure creation
create_base_structure

# Check Node.js and npm
check_node
check_npm

# Install dependencies
run_command "cd backend && npm install"
run_command "cd frontend/client-app && npm install"
run_command "cd frontend/professional-app && npm install"
run_command "cd frontend/admin-panel && npm install"
run_command "cd frontend/support-panel && npm install"

# Create .env for backend (Manual Progress Update)
create_backend_env

# Final step
CURRENT_STEP=$TOTAL_STEPS
PERCENT=100
echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Completed - Progress: $PERCENT%"

# Display final error message if any occurred
if [ ${#ERROR_LOG[@]} -ne 0 ]; then
    echo ""
    echo "⚠️ Errors occurred during execution:"
    for error in "${ERROR_LOG[@]}"; do
        echo "   ❌ $error"
    done
    echo "🔴 Please review the errors above."
    exit 1
else
    echo "🎉 Dependencies installed successfully!"
    echo "✅ No errors encountered!"
    echo "➡️ Proceed to the next step: bash 7populate_database.sh"
fi
