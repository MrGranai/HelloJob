#!/bin/bash
# File: 2setup_frontend_structure.sh
# Description: Script to create the frontend structure for HelloJob
# Function: Creates folders and files without starting services or seeding databases

echo "🎨 Setting up HelloJob Frontend..."

TOTAL_STEPS=29
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

# Create frontend root structure
run_command "mkdir -p frontend && cd frontend"

# ==========================
# CLIENT APP
# ==========================
run_command "mkdir -p client-app/public client-app/src/components client-app/src/pages client-app/src/services client-app/src/styles"
run_command "touch client-app/public/index.html client-app/src/App.js client-app/package.json"
run_command "touch client-app/src/components/Button.jsx client-app/src/components/Header.jsx client-app/src/components/Modal.jsx client-app/src/components/Footer.jsx"
run_command "touch client-app/src/pages/LoginPage.jsx client-app/src/pages/Dashboard.jsx"
run_command "touch client-app/src/services/api.js client-app/src/services/userService.js"
run_command "touch client-app/src/styles/global.css client-app/src/styles/LoginPage.css"

# ==========================
# PROFESSIONAL APP
# ==========================
run_command "mkdir -p professional-app/public professional-app/src/components professional-app/src/pages professional-app/src/services professional-app/src/styles"
run_command "touch professional-app/public/index.html professional-app/src/App.js professional-app/package.json"
run_command "touch professional-app/src/components/Sidebar.jsx professional-app/src/components/ServiceCard.jsx professional-app/src/components/Modal.jsx professional-app/src/components/Footer.jsx"
run_command "touch professional-app/src/pages/LoginPage.jsx professional-app/src/pages/Dashboard.jsx"
run_command "touch professional-app/src/services/api.js professional-app/src/services/professionalService.js"
run_command "touch professional-app/src/styles/global.css professional-app/src/styles/Dashboard.css"

# ==========================
# ADMIN PANEL
# ==========================
run_command "mkdir -p admin-panel/public admin-panel/src/components admin-panel/src/pages admin-panel/src/services admin-panel/src/styles"
run_command "touch admin-panel/public/index.html admin-panel/src/App.js admin-panel/package.json"
run_command "touch admin-panel/src/components/Sidebar.jsx"
run_command "touch admin-panel/src/pages/Dashboard.jsx admin-panel/src/pages/UserManagement.jsx"
run_command "touch admin-panel/src/services/adminService.js"
run_command "touch admin-panel/src/styles/admin.css"

# ==========================
# SUPPORT PANEL
# ==========================
run_command "mkdir -p support-panel/public support-panel/src/components support-panel/src/pages support-panel/src/services support-panel/src/styles"
run_command "touch support-panel/public/index.html support-panel/src/App.js support-panel/package.json"
run_command "touch support-panel/src/components/TicketList.jsx"
run_command "touch support-panel/src/pages/TicketPage.jsx support-panel/src/pages/FAQ.jsx"
run_command "touch support-panel/src/services/supportService.js"
run_command "touch support-panel/src/styles/support.css"

# Populate basic App.js for each app
for app in client-app professional-app admin-panel support-panel
do
  cat <<EOL > $app/src/App.js
import React from 'react';

function App() {
    return (
        <div>
            <h1>HelloJob - ${app}</h1>
        </div>
    );
}

export default App;
EOL
  CURRENT_STEP=$((CURRENT_STEP + 1))
  PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))
  echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Completed - Progress: $PERCENT%"
done

# Create Main Frontend README
cat <<EOL > README.md
# 📂 HelloJob - Frontend

This repository contains the frontend implementation of HelloJob.

## Project Structure
- **client-app/** - Client-facing application (React)
- **professional-app/** - Professional portal (React)
- **admin-panel/** - Admin panel (React)
- **support-panel/** - Support ticket system (React)

Each app operates independently with shared design patterns.

## Next Steps
- Implement functionality and connect to the backend API.
- Use a separate script to run services and seed databases if needed.
- Install dependencies for each app manually using \`npm install\`.
EOL

CURRENT_STEP=$TOTAL_STEPS
PERCENT=100
echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Completed - Progress: $PERCENT%"

echo "🎉 Frontend structure created successfully!"

# Exibir mensagem final de erros, se houver
if [ ${#ERROR_LOG[@]} -ne 0 ]; then
    echo ""
    echo "⚠️  The following errors occurred during execution:"
    for error in "${ERROR_LOG[@]}"; do
        echo "   ❌ $error"
    done
    echo "🔴 Please review the errors above."
else
    echo "✅ No errors encountered!"
    echo "🚀 Proceed by running the next script to set up additional configurations:"
    echo "   ./3setup_services.sh"
fi
