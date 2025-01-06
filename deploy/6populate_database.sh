#!/bin/bash
# File: 6populate_database.sh
# Description: Script to populate the HelloJob database with initial data for testing
# Function: Populates the database with initial test data

echo "🗃️ Populating the HelloJob database with test data..."

TOTAL_STEPS=7
CURRENT_STEP=0
ERROR_LOG=()

run_command() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    echo "Running: $1"
    eval "$1"
    if [ $? -eq 0 ]; then
        PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))
        echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Completed - Progress: $PERCENT%"
    else
        PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))
        echo "❌ [$CURRENT_STEP/$TOTAL_STEPS] Failed - $1"
        ERROR_LOG+=("$1")
    fi
}

# Seed users (Clients, Professionals, Admins, Support Technicians)
run_command "sqlite3 backend/database/hellojob.db <<EOF
INSERT INTO users (name, email, password, role) VALUES
('John Doe', 'client1@example.com', 'password123', 'client'),
('Jane Smith', 'client2@example.com', 'password123', 'client'),
('Michael Johnson', 'pro1@example.com', 'password123', 'professional'),
('Emily Davis', 'pro2@example.com', 'password123', 'professional'),
('Alice Williams', 'admin@example.com', 'adminpassword', 'admin'),
('James Brown', 'support@example.com', 'supportpassword', 'support');
EOF"

# Seed services (service categories for clients and professionals)
run_command "sqlite3 backend/database/hellojob.db <<EOF
INSERT INTO services (name, description, price) VALUES
('Electrical Repair', 'Fixing wiring and electrical issues', 150.00),
('Plumbing', 'Fixing leaks and water-related issues', 100.00),
('Home Cleaning', 'General cleaning and home maintenance', 50.00),
('Carpentry', 'Woodwork and furniture repair', 120.00);
EOF"

# Seed professional profiles
run_command "sqlite3 backend/database/hellojob.db <<EOF
INSERT INTO professionals (user_id, description, availability) VALUES
(3, 'Experienced electrician specializing in residential repairs.', 'Available on weekends'),
(4, 'Plumber with 5 years of experience in leak repairs and installations.', 'Available on weekdays');
EOF"

# Seed ticket system for support
run_command "sqlite3 backend/database/hellojob.db <<EOF
INSERT INTO tickets (user_id, issue, status) VALUES
(1, 'Issue with service request submission', 'open'),
(2, 'Unable to view service offers', 'open'),
(3, 'Need help with profile update', 'closed');
EOF"

# Seed service requests from clients
run_command "sqlite3 backend/database/hellojob.db <<EOF
INSERT INTO service_requests (user_id, service_id, status) VALUES
(1, 1, 'pending'),
(2, 3, 'in_progress');
EOF"

# Seed reviews for professionals
run_command "sqlite3 backend/database/hellojob.db <<EOF
INSERT INTO reviews (user_id, professional_id, rating, comment) VALUES
(1, 3, 5, 'Excellent electrician, highly recommended!'),
(2, 4, 4, 'Good plumber, but took longer than expected.');
EOF"

# Final step
CURRENT_STEP=$TOTAL_STEPS
PERCENT=100
echo "✅ [$CURRENT_STEP/$TOTAL_STEPS] Completed - Progress: $PERCENT%"

echo "🎉 Database populated with test data successfully!"

# Exibir mensagem final de erros, se houver
if [ ${#ERROR_LOG[@]} -ne 0 ]; then
    echo ""
    echo "⚠️  The following errors occurred during execution:"
    for error in "${ERROR_LOG[@]}"; do
        echo "   ❌ $error"
    done
    echo "🔴 Please review the errors above."
    exit 1
else
    echo "✅ No errors encountered!"
    echo "➡️ Proceed to the next step: bash 8start_services.sh"
fi
