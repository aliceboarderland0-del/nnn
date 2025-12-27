import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, username } = body

    if (!email || !username) {
      return NextResponse.json(
        { error: 'Email and username are required' },
        { status: 400 }
      )
    }

    // Initialize Supabase client
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
    const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

    if (!supabaseUrl || !supabaseAnonKey) {
      console.error('Missing Supabase environment variables')
      return NextResponse.json(
        { error: 'Database configuration error' },
        { status: 500 }
      )
    }

    const supabase = createClient(supabaseUrl, supabaseAnonKey)

    // Insert data into Supabase database
    const { data: insertedData, error } = await supabase
      .from('user_data')
      .insert([
        {
          email: email.trim(),
          username: username.trim(),
        },
      ])
      .select()
      .single()

    if (error) {
      console.error('Error saving to database:', error)
      return NextResponse.json(
        { error: 'Failed to save data to database' },
        { status: 500 }
      )
    }

    // Return the saved data with timestamp
    return NextResponse.json({
      success: true,
      data: {
        email: insertedData.email,
        username: insertedData.username,
        timestamp: insertedData.created_at,
      },
    })
  } catch (error) {
    console.error('Error saving data:', error)
    return NextResponse.json(
      { error: 'Failed to save data' },
      { status: 500 }
    )
  }
}

