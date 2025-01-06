-- Insert initial users (admin, support, clients, professionals)
INSERT INTO users (name, email, password, role) VALUES
('Admin', 'admin@example.com', 'adminpassword', 'admin'),
('Support', 'support@example.com', 'supportpassword', 'support'),
('John Doe', 'client1@example.com', 'password123', 'client'),
('Jane Smith', 'client2@example.com', 'password123', 'client'),
('Michael Johnson', 'pro1@example.com', 'password123', 'professional'),
('Emily Davis', 'pro2@example.com', 'password123', 'professional');

-- Insert electrical services (installation and maintenance)
INSERT INTO services (name, description, category, price) VALUES
('Residential Electrical Installation', 'Complete wiring and electrical installation for homes.', 'installation', 2500.00),
('Industrial Electrical Installation', 'Industrial-grade electrical installations and panel configuration.', 'installation', 5000.00),
('Lighting Installation', 'Installation of LED lighting and fixtures.', 'installation', 800.00),
('General Electrical Maintenance', 'Routine maintenance for electrical panels and wiring.', 'maintenance', 600.00),
('Emergency Electrical Repair', 'Emergency repairs for electrical failures.', 'maintenance', 1200.00),
('Transformer Maintenance', 'Inspection and maintenance of electrical transformers.', 'maintenance', 3500.00);

-- Insert service requests (clients requesting services)
INSERT INTO service_requests (user_id, service_id, status) VALUES
(3, 1, 'in_progress'),
(4, 2, 'pending');

-- Insert support tickets
INSERT INTO tickets (user_id, issue, status) VALUES
(3, 'Cannot complete payment', 'open'),
(4, 'Issue with scheduling service', 'open');

-- Insert service reviews
INSERT INTO reviews (user_id, professional_id, rating, comment) VALUES
(3, 5, 5, 'Excellent electrical installation service!'),
(4, 6, 4, 'Good electrician, but arrived late.');
