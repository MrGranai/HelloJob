
const User = require('../models/userModel');

// Lista todos os profissionais
exports.listProfessionals = async (req, res) => {
  try {
    const professionals = await User.findAll({ where: { role: 'professional' } });
    res.status(200).json(professionals);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
