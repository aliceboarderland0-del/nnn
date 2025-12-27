# Supabase Setup Guide

Follow these steps to connect your app to Supabase:

## Step 1: Create a Supabase Account and Project

1. Go to https://supabase.com
2. Sign up or log in
3. Click "New Project"
4. Fill in:
   - Project Name: `instagram-unfollowers` (or any name)
   - Database Password: Create a strong password (save it!)
   - Region: Choose closest to you
   - Pricing Plan: Free tier is fine
5. Click "Create new project"
6. Wait 2-3 minutes for the project to be ready

## Step 2: Get Your Supabase Credentials

1. In your Supabase project dashboard, click on "Settings" (gear icon in sidebar)
2. Click on "API" in the settings menu
3. You'll see:
   - **Project URL** (looks like: `https://xxxxxxxxxxxxx.supabase.co`)
   - **anon/public key** (a long string starting with `eyJ...`)

## Step 3: Create the Database Table

1. In Supabase dashboard, click "Table Editor" in the sidebar
2. Click "Create a new table"
3. Set table name: `user_data`
4. Click "Enable Row Level Security (RLS)" - leave it checked
5. Add these columns:
   
   | Column Name | Type | Default Value | Nullable |
   |------------|------|---------------|----------|
   | id | int8 | auto-increment | No |
   | email | text | - | No |
   | username | text | - | No |
   | created_at | timestamptz | now() | No |

6. Click "Save"
7. After table is created:
   - Click on the table name
   - Click "Policies" tab
   - Click "New Policy"
   - Select "Enable insert access for all users" (or create custom policy)
   - For development, you can disable RLS temporarily:
     - Go back to Table Editor
     - Click on `user_data` table
     - Click the settings icon (three dots)
     - Toggle off "Enable Row Level Security"

## Step 4: Set Up Environment Variables

1. Create a file named `.env.local` in your project root (same folder as `package.json`)
2. Add these lines (replace with your actual values):

```
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

3. Replace:
   - `https://your-project-id.supabase.co` with your Project URL from Step 2
   - `your-anon-key-here` with your anon/public key from Step 2

## Step 5: Install Dependencies

Run this command in your terminal:

```bash
npm install
```

This will install the Supabase client library.

## Step 6: Restart Your Development Server

1. Stop your current server (Ctrl+C)
2. Start it again:

```bash
npm run dev
```

## Step 7: Test It!

1. Open your app at http://localhost:3000
2. Fill in the form and submit
3. Check your Supabase dashboard:
   - Go to "Table Editor"
   - Click on `user_data` table
   - You should see your submitted data!

## Troubleshooting

**Error: Missing Supabase environment variables**
- Make sure `.env.local` file exists in the project root
- Make sure variable names are exactly: `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- Restart your development server after creating/modifying `.env.local`

**Error: Failed to save data**
- Check your Supabase credentials are correct
- Make sure the table name is exactly `user_data`
- Make sure the table has columns: `email`, `username`, `created_at`
- Disable RLS (Row Level Security) for testing if needed

**Can't see data in Supabase**
- Refresh the Table Editor page
- Check the table name is correct
- Verify the API route is being called (check browser console)

