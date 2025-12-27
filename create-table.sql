-- ============================================
-- Quick Setup SQL Script for Supabase
-- ============================================
-- HOW TO USE:
-- 1. Open Supabase Dashboard
-- 2. Go to SQL Editor (left sidebar)
-- 3. Click "New Query"
-- 4. Copy everything below this line and paste
-- 5. Click "Run" button
-- ============================================

CREATE TABLE IF NOT EXISTS user_data (
  id BIGSERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  username TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_user_data_email ON user_data(email);
CREATE INDEX IF NOT EXISTS idx_user_data_created_at ON user_data(created_at DESC);

ALTER TABLE user_data ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow all operations" ON user_data;

CREATE POLICY "Allow all operations" ON user_data
  FOR ALL
  USING (true)
  WITH CHECK (true);

