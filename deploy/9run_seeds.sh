#!/bin/bash
# File: 9run_seeds.sh
# Description: Populates the database with initial seed data

DB_PATH="backend/database/hellojob.db"
SEEDS_DIR="backend/database/seeds"

echo "🌱 Running seed scripts..."

for file in "$SEEDS_DIR"/*.sql
do
  echo "🌾 Seeding data from: $file"
  sqlite3 "$DB_PATH" < "$file"
  if [ $? -eq 0 ]; then
    echo "✅ Data seeded from: $file"
  else
    echo "❌ Failed to seed: $file"
    exit 1
  fi
done

echo "🎉 All seed data inserted successfully!"
