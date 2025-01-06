#!/bin/bash
# File: 3verify_backend_structure.sh
# Description: Verifies if the backend structure for HelloJob was created correctly
# Function: Checks for the existence of directories and files, showing progress and missing items

echo "🔍 Verifying HelloJob Backend Structure..."

# Expected directories
DIRECTORIES=(
    "backend"
    "backend/config"
    "backend/controllers"
    "backend/middlewares"
    "backend/models"
    "backend/routes"
    "backend/services"
    "backend/utils"
    "backend/database"
    "backend/database/migrations"
    "backend/database/seeds"
)

# Expected files
FILES=(
    "backend/config/db.js"
    "backend/config/env.js"
    "backend/controllers/userController.js"
    "backend/controllers/professionalController.js"
    "backend/controllers/adminController.js"
    "backend/controllers/supportController.js"
    "backend/middlewares/authMiddleware.js"
    "backend/middlewares/validationMiddleware.js"
    "backend/middlewares/loggerMiddleware.js"
    "backend/middlewares/errorMiddleware.js"
    "backend/models/userModel.js"
    "backend/models/professionalModel.js"
    "backend/models/serviceModel.js"
    "backend/models/ticketModel.js"
    "backend/routes/index.js"
    "backend/routes/userRoutes.js"
    "backend/routes/professionalRoutes.js"
    "backend/routes/adminRoutes.js"
    "backend/routes/supportRoutes.js"
    "backend/services/emailService.js"
    "backend/services/notificationService.js"
    "backend/services/analyticsService.js"
    "backend/utils/dateUtils.js"
    "backend/database/hellojob.db"
    "backend/database/schema.sql"
    "backend/database/seeds.sql"
    "backend/database/migrations/create_users_table.sql"
    "backend/database/migrations/create_services_table.sql"
    "backend/database/migrations/create_tickets_table.sql"
    "backend/database/seeds/seed_users.sql"
    "backend/database/seeds/seed_services.sql"
    "backend/database/seeds/seed_tickets.sql"
    "backend/app.js"
    "backend/server.js"
    "backend/package.json"
    "backend/.env"
    "backend/README.md"
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
    echo "🎉 All backend directories and files are correctly in place!"
    echo "🚀 Proceed by running the next script to verify frontend structure:"
    echo "   ./4verify_frontend_structure.sh"
fi
