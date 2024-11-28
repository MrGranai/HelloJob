
const { Sequelize } = require('sequelize');

// Configuração do banco SQLite
const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: './backend/database/hellojob.db', // Caminho do banco de dados
});

sequelize
  .authenticate()
  .then(() => {
    console.log('Conexão com o SQLite estabelecida com sucesso.');
  })
  .catch((err) => {
    console.error('Erro ao conectar ao banco de dados:', err);
  });

module.exports = sequelize;
