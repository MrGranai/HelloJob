#!/bin/bash

# Diretório base do projeto
PROJECT_DIR="D:/Projeto/HelloJob"

# Criar a estrutura de diretórios
echo "Criando estrutura de diretórios..."

# Diretórios principais
mkdir -p $PROJECT_DIR/{backend/{config,controllers,middlewares,models,routes,services,database/{migrations,seeds}},frontend/client-app/src/{components,pages,services,styles},admin-panel/src/{components,pages,services,styles},support/src/{components,pages,services,styles}}

# Criar arquivos no backend
echo "Criando arquivos no backend..."
touch $PROJECT_DIR/backend/{app.js,server.js,.env,README.md,package.json,package-lock.json}
touch $PROJECT_DIR/backend/config/{db.js,env.js}
touch $PROJECT_DIR/backend/controllers/{userController.js,professionalController.js,adminController.js,supportController.js}
touch $PROJECT_DIR/backend/middlewares/{authMiddleware.js,validationMiddleware.js}
touch $PROJECT_DIR/backend/models/{userModel.js,professionalModel.js,serviceModel.js,ticketModel.js}
touch $PROJECT_DIR/backend/routes/{index.js,userRoutes.js,professionalRoutes.js,adminRoutes.js,supportRoutes.js}
touch $PROJECT_DIR/backend/services/{emailService.js,notificationService.js,analyticsService.js}
touch $PROJECT_DIR/backend/database/{hellojob.db,schema.sql,seeds.sql}
touch $PROJECT_DIR/backend/database/migrations/{create_users_table.sql,create_services_table.sql,create_tickets_table.sql}
touch $PROJECT_DIR/backend/database/seeds/{seed_users.sql,seed_services.sql,seed_tickets.sql}

# Criar arquivos no frontend
echo "Criando arquivos no frontend..."
touch $PROJECT_DIR/frontend/client-app/{package.json,README.md}
touch $PROJECT_DIR/frontend/client-app/src/{App.js,global.css}
touch $PROJECT_DIR/frontend/client-app/src/components/{Button.jsx,Header.jsx}
touch $PROJECT_DIR/frontend/client-app/src/pages/{LoginPage.jsx,Dashboard.jsx}
touch $PROJECT_DIR/frontend/client-app/src/services/{api.js,userService.js}
touch $PROJECT_DIR/frontend/client-app/src/styles/{global.css,LoginPage.css}

# Criar arquivos no admin-panel
echo "Criando arquivos no admin-panel..."
touch $PROJECT_DIR/admin-panel/{package.json,README.md}
touch $PROJECT_DIR/admin-panel/src/{App.js}
touch $PROJECT_DIR/admin-panel/src/components/{Button.jsx,Sidebar.jsx}
touch $PROJECT_DIR/admin-panel/src/pages/{Dashboard.jsx,UserManagement.jsx}
touch $PROJECT_DIR/admin-panel/src/services/{api.js,adminService.js}
touch $PROJECT_DIR/admin-panel/src/styles/{global.css,Dashboard.css}

# Preencher conteúdo básico no admin-panel/src/App.js
cat <<EOL > $PROJECT_DIR/admin-panel/src/App.js
// App.js para o painel administrativo
import React from 'react';

const App = () => {
    return <h1>Admin Panel</h1>;
};

export default App;
EOL

# Criar arquivos no suporte técnico
echo "Criando arquivos no suporte técnico..."
touch $PROJECT_DIR/support/{package.json,README.md}
touch $PROJECT_DIR/support/src/{App.js}
touch $PROJECT_DIR/support/src/components/{TicketForm.jsx,FAQItem.jsx}
touch $PROJECT_DIR/support/src/pages/{TicketPage.jsx,FAQ.jsx}
touch $PROJECT_DIR/support/src/services/supportService.js
touch $PROJECT_DIR/support/src/styles/{global.css,TicketPage.css}

# Preencher conteúdo básico no support/src/App.js
cat <<EOL > $PROJECT_DIR/support/src/App.js
// App.js para o suporte técnico
import React from 'react';

const App = () => {
    return <h1>Support Panel</h1>;
};

export default App;
EOL

# Criar arquivos gerais do projeto
echo "Criando arquivos gerais..."
touch $PROJECT_DIR/{HelloJob_Production_Plan.md,README.md}

echo "Estrutura completa do HelloJob criada com sucesso!"
