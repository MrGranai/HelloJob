
const sequelize = require('../../config/db');
const User = require('../../models/userModel');
const Service = require('../../models/serviceModel');

const migrate = async () => {
  try {
    await sequelize.authenticate();
    console.log('Conexão com o banco de dados estabelecida.');

    await sequelize.sync({ force: true }); // CUIDADO: force recria as tabelas
    console.log('Modelos sincronizados com sucesso.');
  } catch (err) {
    console.error('Erro ao sincronizar modelos:', err);
  } finally {
    await sequelize.close();
  }
};

migrate();
