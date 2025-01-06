# 📂 HelloJob

HelloJob is an innovative platform that connects clients to professionals, enabling the hiring of services in a fast, secure, and efficient manner. The project has a modular architecture with dedicated applications for clients, professionals, administration, and support.

---

## 📂 Project Structure

```
HelloJob/
|
|-- backend/                  # Backend - API and database
|   |-- config/               # General configurations
|   |-- controllers/          # Business logic
|   |-- middlewares/          # Authentication and validation
|   |-- models/               # Data models
|   |-- routes/               # API routes
|   |-- services/             # Auxiliary services (email, notifications)
|   |-- database/             # SQL scripts (creation and seeds)
|   |-- app.js                # Express configuration
|   |-- server.js             # Server initialization
|
|-- frontend/                 # Frontend - User interfaces (React)
|   |-- client-app/           # Client application
|   |-- professional-app/     # Professional portal
|   |-- admin-panel/          # Administrative panel
|   |-- support-panel/        # Support system
|
|-- deploy/                   # Automation and deployment scripts
|-- docs/                     # Documentation and planning
|   |-- 000 HelloJob Commit Convention.md
|   |-- 001 HelloJob Project Planning.md
|   |-- HelloJob_Frontend_Modules_and_Users.md
|
|-- README.md                 # Main documentation
```

---

## ✨ Main Features

- **Clients:**

  - Registration and login
  - Service search and requests
  - Chat with professionals after quote acceptance
  - Order management

- **Professionals:**

  - Profile creation and management
  - Purchase of leads to contact clients
  - Service and availability negotiation

- **Administration:**

  - Comment and review moderation
  - User control (create, edit, delete)
  - Report and analysis generation

- **Support:**

  - Support ticket management
  - User assistance
  - FAQ and documentation updates

---

## 🛠️ Technologies Used

Frontend: React.js, Redux, Axios

Backend: Node.js (Express), JWT, bcrypt, Helmet.js, Express-rate-limit, Validator.js

Database: SQLite (with the possibility of migrating to Firestore or other scalable databases such as PostgreSQL or MongoDB)

Security: Rate Limiting, CORS, Helmet.js for HTTP header protection, Input sanitization with Validator.js, and brute force attack prevention.

Deploy and CI/CD: Docker, GitHub Actions

---

## 🤝 Contribution

This project is developed individually for academic purposes and does not accept direct contributions to the code. Suggestions are always welcome and can be made through issues.

---

## 📄 License

This project is licensed under the MIT License. HelloJob acts exclusively as a technological interface connecting clients and professionals, without providing or mediating services of any kind. The application disclaims any responsibility for transactions, agreements, or services carried out between the parties.

