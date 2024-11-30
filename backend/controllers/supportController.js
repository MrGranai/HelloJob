/**
 * File: supportController.js
 * Description: Handles support-related logic.
 */

exports.contactSupport = (req, res) => {
    const { name, email, message } = req.body;

    if (!name || !email || !message) {
        return res.status(400).json({ error: 'All fields are required.' });
    }

    res.status(200).json({ message: 'Support request submitted successfully.' });
};
