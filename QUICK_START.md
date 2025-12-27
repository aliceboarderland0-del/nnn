# Quick Start - Supabase Setup

## 🔧 Setup Steps (5 minutes)

### 1. Create Supabase Account & Project
- Go to https://supabase.com and sign up
- Create a new project
- Wait for project to initialize

### 2. Get Your Credentials
- Settings → API
- Copy **Project URL** and **anon/public key**

### 3. Create Database Table
**Option A: Use SQL (Easiest)**
- Go to SQL Editor in Supabase
- Copy and paste the entire content from `supabase-table.sql`
- Click "Run"

**Option B: Use Table Editor**
- Table Editor → Create new table
- Name: `user_data`
- Add columns:
  - `id` (auto-increment, primary key)
  - `email` (text)
  - `username` (text)
  - `created_at` (timestamp, default: now())

### 4. Create `.env.local` File
Create a file named `.env.local` in your project root:

```
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

Replace with your actual values from Step 2.

### 5. Restart Server
```bash
npm run dev
```

### 6. Test!
Submit the form and check your Supabase table - data should appear!

---

📖 **Full detailed guide:** See `SUPABASE_SETUP.md`

