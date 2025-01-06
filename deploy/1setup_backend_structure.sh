#!/bin/bash
# File: 1setup_backend_structure.sh
# Description: Script to create the backend structure for HelloJob
# Function: Creates folders and files without starting the server or seeding the database

echo "🔧 Setting up HelloJob Backend..."

TOTAL_STEPS=22
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

# Create backend root structure
run_command "mkdir -p backend && cd backend"

# CONFIG
run_command "mkdir -p config"
run_command "touch config/db.js config/env.js"

# CONTROLLERS
run_command "mkdir -p controllers"
run_command "touch controllers/userController.js controllers/professionalController.js controllers/adminController.js controllers/supportController.js"

# MIDDLEWARES
run_command "mkdir -p middlewares"
run_command "touch middlewares/authMiddleware.js middlewares/validationMiddleware.js middlewares/loggerMiddleware.js middlewares/errorMiddleware.js"

# MODELS
run_command "mkdir -p models"
run_command "touch models/userModel.js models/professionalModel.js models/serviceModel.js models/ticketModel.js"

# ROUTES
run_command "mkdir -p routes"
run_command "touch routes/index.js routes/userRoutes.js routes/professionalRoutes.js routes/adminRoutes.js routes/supportRoutes.js"

# SERVICES
run_command "mkdir -p services"
run_command "touch services/emailService.js services/notificationService.js services/analyticsService.js"

# UTILS
run_command "mkdir -p utils"
run_command "touch utils/dateUtils.js"

# DATABASE STRUCTURE (FILES ONLY, NO EXECUTION)
run_command "mkdir -p database/migrations database/seeds"
run_command "touch database/hellojob.db database/schema.sql database/seeds.sql"
run_command "touch database/migrations/create_users_table.sql database/migrations/create_services_table.sql database/migrations/create_tickets_table.sql"
run_command "touch database/seeds/seed_users.sql database/seeds/seed_services.sql database/seeds/seed_tickets.sql"

# MAIN FILES (WITHOUT SERVER START)
run_command "touch app.js server.js package.json .env README.md"

cat <<EOL > README.md
# 📂 HelloJob - Backend

This repository contains the backend implementation of HelloJob.

## Project Structure
- **config/** - Configuration files
- **controllers/** - Business logic
- **middlewares/** - Middleware for authentication and validation
- **models/** - Database models
- **routes/** - API endpoints
- **services/** - Auxiliary services (email, notifications)
- **database/** - SQLite database and migration files

## Next Steps
- Populate the database using a separate migration script.
- Install dependencies and start the server manually when necessary.
EOL

# Update final progress to 100%
CURRENT_STEP=$TOTAL_STEPS
PERCENT=100
echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Completed - Progress: $PERCENT%"

echo "🎉 Backend structure created successfully!"

# Display final error message if any
if [ ${#ERROR_LOG[@]} -ne 0 ]; then
    echo ""
    echo "⚠️  The following errors occurred during execution:"
    for error in "${ERROR_LOG[@]}"; do
        echo "   ❌ $error"
    done
    echo "🔴 Please review the errors above."
else
    echo "✅ No errors encountered!"
    echo "🚀 Proceed by running the next script to set up the frontend structure:"
    echo "   ./2setup_frontend_structure.sh"
fi