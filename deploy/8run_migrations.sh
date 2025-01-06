#!/bin/bash
# File: 8run_migrations.sh
# Description: Applies all SQL migration files to create tables in the database

DB_PATH="backend/database/hellojob.db"
MIGRATIONS_DIR="backend/database/migrations"

echo "🚀 Running database migrations..."

for file in "$MIGRATIONS_DIR"/*.sql
do
  echo "📄 Applying migration: $file"
  sqlite3 "$DB_PATH" < "$file"
  if [ $? -eq 0 ]; then
    echo "✅ Migration applied: $file"
  else
    echo "❌ Failed to apply: $file"
    exit 1
  fi
done

echo "🎉 All migrations applied successfully!"
