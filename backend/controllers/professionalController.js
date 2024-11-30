/**
 * File: professionalController.js
 * Description: Handles professional-related logic.
 */

exports.getProfessionals = (req, res) => {
  // Simulate fetching professionals (replace with database query)
  const professionals = [
      { id: 1, name: 'John Doe', profession: 'Electrician' },
      { id: 2, name: 'Jane Smith', profession: 'Plumber' },
  ];

  res.status(200).json(professionals);
};
