#!/bin/bash
# File: 4verify_frontend_structure.sh
# Description: Verifies if the frontend structure for HelloJob was created correctly
# Function: Checks for the existence of directories and files, showing progress and missing items

echo "🔍 Verifying HelloJob Frontend Structure..."

# Expected directories
DIRECTORIES=(
    "frontend"
    "frontend/client-app/public"
    "frontend/client-app/src/components"
    "frontend/client-app/src/pages"
    "frontend/client-app/src/services"
    "frontend/client-app/src/styles"
    "frontend/professional-app/public"
    "frontend/professional-app/src/components"
    "frontend/professional-app/src/pages"
    "frontend/professional-app/src/services"
    "frontend/professional-app/src/styles"
    "frontend/admin-panel/public"
    "frontend/admin-panel/src/components"
    "frontend/admin-panel/src/pages"
    "frontend/admin-panel/src/services"
    "frontend/admin-panel/src/styles"
    "frontend/support-panel/public"
    "frontend/support-panel/src/components"
    "frontend/support-panel/src/pages"
    "frontend/support-panel/src/services"
    "frontend/support-panel/src/styles"
)

# Expected files
FILES=(
    "frontend/client-app/public/index.html"
    "frontend/client-app/src/App.js"
    "frontend/client-app/package.json"
    "frontend/client-app/src/components/Button.jsx"
    "frontend/client-app/src/components/Header.jsx"
    "frontend/client-app/src/components/Modal.jsx"
    "frontend/client-app/src/components/Footer.jsx"
    "frontend/client-app/src/pages/LoginPage.jsx"
    "frontend/client-app/src/pages/Dashboard.jsx"
    "frontend/client-app/src/services/api.js"
    "frontend/client-app/src/services/userService.js"
    "frontend/client-app/src/styles/global.css"
    "frontend/client-app/src/styles/LoginPage.css"
    "frontend/professional-app/public/index.html"
    "frontend/professional-app/src/App.js"
    "frontend/professional-app/package.json"
    "frontend/professional-app/src/components/Sidebar.jsx"
    "frontend/professional-app/src/components/ServiceCard.jsx"
    "frontend/professional-app/src/components/Modal.jsx"
    "frontend/professional-app/src/components/Footer.jsx"
    "frontend/professional-app/src/pages/LoginPage.jsx"
    "frontend/professional-app/src/pages/Dashboard.jsx"
    "frontend/professional-app/src/services/api.js"
    "frontend/professional-app/src/services/professionalService.js"
    "frontend/professional-app/src/styles/global.css"
    "frontend/professional-app/src/styles/Dashboard.css"
    "frontend/admin-panel/public/index.html"
    "frontend/admin-panel/src/App.js"
    "frontend/admin-panel/package.json"
    "frontend/admin-panel/src/components/Sidebar.jsx"
    "frontend/admin-panel/src/pages/Dashboard.jsx"
    "frontend/admin-panel/src/pages/UserManagement.jsx"
    "frontend/admin-panel/src/services/adminService.js"
    "frontend/admin-panel/src/styles/admin.css"
    "frontend/support-panel/public/index.html"
    "frontend/support-panel/src/App.js"
    "frontend/support-panel/package.json"
    "frontend/support-panel/src/components/TicketList.jsx"
    "frontend/support-panel/src/pages/TicketPage.jsx"
    "frontend/support-panel/src/pages/FAQ.jsx"
    "frontend/support-panel/src/services/supportService.js"
    "frontend/support-panel/src/styles/support.css"
)

# Total steps (directories + files)
TOTAL_STEPS=$(( ${#DIRECTORIES[@]} + ${#FILES[@]} ))
CURRENT_STEP=0
ERROR_COUNT=0
MISSING_ITEMS=()

run_check() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))

    if [ -e "$1" ]; then
        echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Exists - $1 (Progress: $PERCENT%)"
    else
        echo "❌ [$CURRENT_STEP/$TOTAL_STEPS] Missing - $1 (Progress: $PERCENT%)"
        ERROR_COUNT=$((ERROR_COUNT + 1))
        MISSING_ITEMS+=("$1")
    fi
}

# Verify directories
for dir in "${DIRECTORIES[@]}"; do
    run_check "$dir"
done

# Verify files
for file in "${FILES[@]}"; do
    run_check "$file"
done

# Final result display
if [ $ERROR_COUNT -ne 0 ]; then
    echo ""
    echo "⚠️  $ERROR_COUNT items are missing. Please review the list below:"
    for item in "${MISSING_ITEMS[@]}"; do
        echo "   ❌ $item"
    done
else
    echo "🎉 All frontend directories and files are correctly in place!"
    echo "🚀 Proceed by running the next script to install dependencies:"
    echo "   ./5install_dependencies.sh"
fi
