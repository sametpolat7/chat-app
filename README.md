# Chat App

This is a simple real-time chat application built with Ruby on Rails. It uses `PostgreSQL` for database, `Devise` with authentication, `Pundit` for authorization, ActionCable for real-time messaging and `TailwindCSS` for styling.

## Features
- User Authentication
- Chat Rooms
- Real-Time Messaging
- Authorization
- Flash Messages

### Installation

1. Create a folder and open it with terminal.

```bash
git clone https://gitlab.com/sametpolat7/chat_app.git .
```

2. Install dependencies

```bash
bundle install
```

3. Set up the database

```bash
rails db:create
rails db:migrate
```

Note: Ensure your config/database.yml is correctly configured.

4. Start the Rails server

```bash
rails server
```