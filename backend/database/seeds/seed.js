
const sequelize = require('../../config/db');
const User = require('../../models/userModel');
const Service = require('../../models/serviceModel');

const seed = async () => {
  try {
    await sequelize.authenticate();
    console.log('Conexão estabelecida para seed.');

    // Criar usuários
    await User.bulkCreate([
      { name: 'John Doe', email: 'john@example.com', password: '123456', role: 'client' },
      { name: 'Jane Smith', email: 'jane@example.com', password: '123456', role: 'professional' },
    ]);

    // Criar serviços
    await Service.bulkCreate([
      { name: 'Manutenção', description: 'Serviços de manutenção geral.', price: 100 },
      { name: 'Limpeza', description: 'Serviços de limpeza residencial.', price: 80 },
    ]);

    console.log('Dados iniciais inseridos com sucesso.');
  } catch (err) {
    console.error('Erro ao inserir dados iniciais:', err);
  } finally {
    await sequelize.close();
  }
};

seed();
