-- ============================================
-- Supabase Table Creation Script
-- ============================================
-- Instructions:
-- 1. Go to your Supabase Dashboard
-- 2. Click on "SQL Editor" in the left sidebar
-- 3. Click "New Query"
-- 4. Copy and paste this entire script
-- 5. Click "Run" or press Ctrl+Enter
-- ============================================

-- Drop table if it exists (use only if you want to start fresh)
-- DROP TABLE IF EXISTS user_data CASCADE;

-- Create the user_data table
CREATE TABLE IF NOT EXISTS user_data (
  id BIGSERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  username TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add comments to columns (optional, for documentation)
COMMENT ON TABLE user_data IS 'Stores user email and Instagram username data';
COMMENT ON COLUMN user_data.id IS 'Primary key, auto-incrementing';
COMMENT ON COLUMN user_data.email IS 'User email address';
COMMENT ON COLUMN user_data.username IS 'Instagram username';
COMMENT ON COLUMN user_data.created_at IS 'Timestamp when record was created';

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_user_data_email ON user_data(email);
CREATE INDEX IF NOT EXISTS idx_user_data_created_at ON user_data(created_at DESC);

-- Enable Row Level Security (RLS)
-- For development, we'll create a policy that allows all operations
ALTER TABLE user_data ENABLE ROW LEVEL SECURITY;

-- Drop existing policy if it exists (to avoid conflicts)
DROP POLICY IF EXISTS "Allow all operations" ON user_data;

-- Create a policy to allow all operations (for development/testing only)
-- ⚠️ WARNING: This allows anyone to read/write data
-- For production, you should create more restrictive policies
CREATE POLICY "Allow all operations" ON user_data
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- Verify the table was created (optional - shows table structure)
SELECT 
  column_name, 
  data_type, 
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_name = 'user_data'
ORDER BY ordinal_position;

-- Success message
DO $$
BEGIN
  RAISE NOTICE '✅ Table "user_data" created successfully!';
  RAISE NOTICE '✅ Indexes created!';
  RAISE NOTICE '✅ Row Level Security enabled!';
  RAISE NOTICE '✅ Policy "Allow all operations" created!';
END $$;

