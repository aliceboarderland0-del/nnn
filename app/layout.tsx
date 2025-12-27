import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Instagram Unfollowers Checker',
  description: 'Check who unfollowed you on Instagram',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className="min-h-screen bg-gradient-to-br from-purple-500 via-pink-500 to-orange-500">
        {children}
      </body>
    </html>
  )
}

