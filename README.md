# 📂 HelloJob/

## 📂 backend/                                              # ⚙️ Back-end do sistema
- 📂 config/                                               # ⚙️ Configurações do sistema
  - 📄 db.js                                              # 🛢️ Configuração do banco de dados (SQLite)
  - 📄 env.js                                             # 🌍 Configuração de variáveis de ambiente
- 📂 controllers/                                          # 🧠 Controladores (lógica de negócios)
  - 📄 userController.js                                  # 👤 Lógica para clientes
  - 📄 professionalController.js                          # 💼 Lógica para profissionais
  - 📄 adminController.js                                 # 🔑 Lógica administrativa
  - 📄 supportController.js                               # 💬 Lógica para suporte técnico
- 📂 middlewares/                                          # 🔐 Middlewares de autenticação e validação
  - 📄 authMiddleware.js                                  # 🔑 Middleware para autenticação (JWT)
  - 📄 validationMiddleware.js                            # ✅ Middleware para validação de dados
- 📂 models/                                               # 🗄️ Modelos do banco de dados
  - 📄 userModel.js                                       # 👤 Modelo de usuários
  - 📄 professionalModel.js                               # 💼 Modelo de profissionais
  - 📄 serviceModel.js                                    # 🛠️ Modelo de serviços
  - 📄 ticketModel.js                                     # 🎟️ Modelo de tickets de suporte
- 📂 routes/                                               # 🛣️ Rotas do sistema (API)
  - 📄 index.js                                           # 🌐 Roteador principal
  - 📄 userRoutes.js                                      # 👤 Rotas para clientes
  - 📄 professionalRoutes.js                              # 💼 Rotas para profissionais
  - 📄 adminRoutes.js                                     # 🔑 Rotas administrativas
  - 📄 supportRoutes.js                                   # 💬 Rotas de suporte técnico
- 📂 services/                                             # 🛠️ Serviços auxiliares
  - 📄 emailService.js                                    # ✉️ Serviço de envio de emails
  - 📄 notificationService.js                             # 🔔 Serviço de notificações push
  - 📄 analyticsService.js                                # 📊 Serviço de relatórios e métricas
- 📂 database/                                             # 🛢️ Banco de dados e scripts relacionados
  - 📄 hellojob.db                                        # 🗃️ Arquivo SQLite do banco de dados
  - 📄 schema.sql                                         # 🏗️ Script para criação das tabelas
  - 📄 seeds.sql                                          # 🌱 Script para preenchimento inicial (seed)
  - 📂 migrations/                                        # 🚀 Scripts de migração de banco de dados
    - 📄 create_users_table.sql                           # 👤 Criação da tabela de usuários
    - 📄 create_services_table.sql                        # 🛠️ Criação da tabela de serviços
    - 📄 create_tickets_table.sql                         # 🎟️ Criação da tabela de tickets
  - 📂 seeds/                                             # 🌱 Scripts de inserção inicial
    - 📄 seed_users.sql                                   # 👤 Inserção de usuários
    - 📄 seed_services.sql                                # 🛠️ Inserção de serviços
    - 📄 seed_tickets.sql                                 # 🎟️ Inserção de tickets
  - 📄 README.md                                          # 📚 Documentação do banco de dados
- 📄 app.js                                                # ⚙️ Configuração do aplicativo Express
- 📄 server.js                                             # 🖥️ Inicialização do servidor Express
- 📄 package.json                                          # 📦 Gerenciamento de dependências (Node.js)
- 📄 package-lock.json                                     # 🔒 Controle de versão das dependências
- 📄 .env                                                  # 🌍 Arquivo de variáveis de ambiente
- 📄 README.md                                             # 📚 Documentação do backend

---

## 📂 frontend/                                             # 💻 Front-end do sistema
### 👤 **Aplicação para Clientes (Client-App):**  
- 📂 client-app/                                           
  - 📂 src/                                              
    - 📂 components/                                      # 🧩 Componentes reutilizáveis
      - 📄 Button.jsx                                     # 🔘 Botão de interação
      - 📄 Header.jsx                                     # 🏷️ Cabeçalho do cliente
    - 📂 pages/                                           
      - 📄 LoginPage.jsx                                  # 🔑 Página de login
      - 📄 Dashboard.jsx                                  # 🖥️ Dashboard do cliente
    - 📂 services/                                        
      - 📄 api.js                                         # 🔗 Configuração da API
      - 📄 userService.js                                 # 👤 Serviço para interações com usuários
    - 📂 styles/                                          
      - 📄 global.css                                     # 🎨 Estilos globais
      - 📄 LoginPage.css                                  # 🔑 Estilos da página de login
    - 📄 App.js                                           # 🌐 Ponto de entrada do cliente
  - 📄 package.json                                       
  - 📄 README.md                                          

---

### 💼 **Aplicação para Profissionais (Professional-App):**  
- 📂 professional-app/                                      
  - 📂 src/                                               
    - 📂 components/                                      
      - 📄 Sidebar.jsx                                    # 🗂️ Barra lateral para navegação
      - 📄 ServiceCard.jsx                                # 📋 Card para exibição de serviços
    - 📂 pages/                                           
      - 📄 LoginPage.jsx                                  # 🔑 Página de login do profissional
      - 📄 Dashboard.jsx                                  # 🖥️ Dashboard do profissional
    - 📂 services/                                        
      - 📄 api.js                                         
      - 📄 professionalService.js                         
    - 📂 styles/                                          
      - 📄 global.css                                     
      - 📄 Dashboard.css                                  
    - 📄 App.js                                          
  - 📄 package.json                                       
  - 📄 README.md                                          

---

### 🔑 **Painel Administrativo (Admin-Panel) – Interface Web:**  
- 📂 admin-panel/                                           
  - 📂 public/                                              # 🌐 Arquivos HTML e CSS públicos
  - 📂 src/                                                
    - 📂 components/                                       
    - 📂 pages/                                            
      - 📄 Dashboard.jsx                                   # 🖥️ Painel de controle administrativo
      - 📄 UserManagement.jsx                              # 👥 Gerenciamento de usuários
    - 📂 services/                                         
    - 📂 styles/                                           
    - 📄 App.js                                           
  - 📄 package.json                                        
  - 📄 README.md                                           
  - 📄 index.html                                           # 🏠 Página inicial do painel admin    

---

### 💬 **Painel de Suporte (Support-Panel) – Interface Web:**  
- 📂 support-panel/                                          
  - 📂 public/                                              
  - 📂 src/                                               
    - 📂 components/                                       
    - 📂 pages/                                            
      - 📄 TicketPage.jsx                                   # 🎟️ Página de criação de tickets
      - 📄 FAQ.jsx                                          # ❓ Página de perguntas frequentes
    - 📂 services/                                         
      - 📄 supportService.js                               
    - 📂 styles/                                           
      - 📄 global.css                                     
    - 📄 App.js                                           
  - 📄 package.json                                        
  - 📄 README.md                                           
  - 📄 index.html                                           

---

## 📄 **HelloJob_Production_Plan.md**                          # 📜 Plano de produção detalhado
## 📄 **README.md**                                            # 📚 Documentação geral do projeto
