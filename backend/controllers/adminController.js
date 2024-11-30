/**
 * File: adminController.js
 * Description: Handles admin-related logic.
 */

exports.getAdminDashboard = (req, res) => {
    // Simulate admin dashboard data
    const dashboardData = {
        users: 100,
        professionals: 50,
        services: 200,
    };

    res.status(200).json(dashboardData);
};
