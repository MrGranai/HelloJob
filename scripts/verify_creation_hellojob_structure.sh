#!/bin/bash

# Diretório base do projeto
PROJECT_DIR="D:/Projeto/HelloJob"

# Lista de pastas esperadas
EXPECTED_DIRS=(
    "$PROJECT_DIR/backend/config"
    "$PROJECT_DIR/backend/controllers"
    "$PROJECT_DIR/backend/middlewares"
    "$PROJECT_DIR/backend/models"
    "$PROJECT_DIR/backend/routes"
    "$PROJECT_DIR/backend/services"
    "$PROJECT_DIR/backend/database/migrations"
    "$PROJECT_DIR/backend/database/seeds"
    "$PROJECT_DIR/frontend/client-app/src/components"
    "$PROJECT_DIR/frontend/client-app/src/pages"
    "$PROJECT_DIR/frontend/client-app/src/services"
    "$PROJECT_DIR/frontend/client-app/src/styles"
    "$PROJECT_DIR/admin-panel/src/components"
    "$PROJECT_DIR/admin-panel/src/pages"
    "$PROJECT_DIR/admin-panel/src/services"
    "$PROJECT_DIR/admin-panel/src/styles"
    "$PROJECT_DIR/support/src/components"
    "$PROJECT_DIR/support/src/pages"
    "$PROJECT_DIR/support/src/services"
    "$PROJECT_DIR/support/src/styles"
)

# Lista de arquivos esperados
EXPECTED_FILES=(
    "$PROJECT_DIR/backend/app.js"
    "$PROJECT_DIR/backend/server.js"
    "$PROJECT_DIR/backend/.env"
    "$PROJECT_DIR/backend/README.md"
    "$PROJECT_DIR/backend/package.json"
    "$PROJECT_DIR/backend/package-lock.json"
    "$PROJECT_DIR/backend/config/db.js"
    "$PROJECT_DIR/backend/config/env.js"
    "$PROJECT_DIR/backend/controllers/userController.js"
    "$PROJECT_DIR/backend/controllers/professionalController.js"
    "$PROJECT_DIR/backend/controllers/adminController.js"
    "$PROJECT_DIR/backend/controllers/supportController.js"
    "$PROJECT_DIR/backend/middlewares/authMiddleware.js"
    "$PROJECT_DIR/backend/middlewares/validationMiddleware.js"
    "$PROJECT_DIR/backend/models/userModel.js"
    "$PROJECT_DIR/backend/models/professionalModel.js"
    "$PROJECT_DIR/backend/models/serviceModel.js"
    "$PROJECT_DIR/backend/models/ticketModel.js"
    "$PROJECT_DIR/backend/routes/index.js"
    "$PROJECT_DIR/backend/routes/userRoutes.js"
    "$PROJECT_DIR/backend/routes/professionalRoutes.js"
    "$PROJECT_DIR/backend/routes/adminRoutes.js"
    "$PROJECT_DIR/backend/routes/supportRoutes.js"
    "$PROJECT_DIR/backend/services/emailService.js"
    "$PROJECT_DIR/backend/services/notificationService.js"
    "$PROJECT_DIR/backend/services/analyticsService.js"
    "$PROJECT_DIR/backend/database/hellojob.db"
    "$PROJECT_DIR/backend/database/schema.sql"
    "$PROJECT_DIR/backend/database/seeds.sql"
    "$PROJECT_DIR/backend/database/migrations/create_users_table.sql"
    "$PROJECT_DIR/backend/database/migrations/create_services_table.sql"
    "$PROJECT_DIR/backend/database/migrations/create_tickets_table.sql"
    "$PROJECT_DIR/backend/database/seeds/seed_users.sql"
    "$PROJECT_DIR/backend/database/seeds/seed_services.sql"
    "$PROJECT_DIR/backend/database/seeds/seed_tickets.sql"
    "$PROJECT_DIR/frontend/client-app/package.json"
    "$PROJECT_DIR/frontend/client-app/README.md"
    "$PROJECT_DIR/frontend/client-app/src/App.js"
    "$PROJECT_DIR/frontend/client-app/src/global.css"
    "$PROJECT_DIR/frontend/client-app/src/components/Button.jsx"
    "$PROJECT_DIR/frontend/client-app/src/components/Header.jsx"
    "$PROJECT_DIR/frontend/client-app/src/pages/LoginPage.jsx"
    "$PROJECT_DIR/frontend/client-app/src/pages/Dashboard.jsx"
    "$PROJECT_DIR/frontend/client-app/src/services/api.js"
    "$PROJECT_DIR/frontend/client-app/src/services/userService.js"
    "$PROJECT_DIR/frontend/client-app/src/styles/global.css"
    "$PROJECT_DIR/frontend/client-app/src/styles/LoginPage.css"
    "$PROJECT_DIR/admin-panel/package.json"
    "$PROJECT_DIR/admin-panel/README.md"
    "$PROJECT_DIR/admin-panel/src/App.js"
    "$PROJECT_DIR/admin-panel/src/components/Button.jsx"
    "$PROJECT_DIR/admin-panel/src/components/Sidebar.jsx"
    "$PROJECT_DIR/admin-panel/src/pages/Dashboard.jsx"
    "$PROJECT_DIR/admin-panel/src/pages/UserManagement.jsx"
    "$PROJECT_DIR/admin-panel/src/services/api.js"
    "$PROJECT_DIR/admin-panel/src/services/adminService.js"
    "$PROJECT_DIR/admin-panel/src/styles/global.css"
    "$PROJECT_DIR/admin-panel/src/styles/Dashboard.css"
    "$PROJECT_DIR/support/package.json"
    "$PROJECT_DIR/support/README.md"
    "$PROJECT_DIR/support/src/App.js"
    "$PROJECT_DIR/support/src/components/TicketForm.jsx"
    "$PROJECT_DIR/support/src/components/FAQItem.jsx"
    "$PROJECT_DIR/support/src/pages/TicketPage.jsx"
    "$PROJECT_DIR/support/src/pages/FAQ.jsx"
    "$PROJECT_DIR/support/src/services/supportService.js"
    "$PROJECT_DIR/support/src/styles/global.css"
    "$PROJECT_DIR/support/src/styles/TicketPage.css"
    "$PROJECT_DIR/HelloJob_Production_Plan.md"
    "$PROJECT_DIR/README.md"
)

# Verificar pastas
echo "Verificando pastas..."
for dir in "${EXPECTED_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "❌ Diretório não encontrado: $dir"
    else
        echo "✅ Diretório encontrado: $dir"
    fi
done

# Verificar arquivos
echo "Verificando arquivos..."
for file in "${EXPECTED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ Arquivo não encontrado: $file"
    else
        echo "✅ Arquivo encontrado: $file"
    fi
done

echo "Verificação concluída!"
