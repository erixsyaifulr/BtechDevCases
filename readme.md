# BTECH Wallet - Flutter App

Flutter Web client for the BTECH Wallet Application.

This application connects to the BTECH Wallet Backend API and provides:

- User Registration\
- User Login\
- View Total Balance\
- Transfer Balance\
- Transaction History

---

## Tech Stack

- Flutter\
- Bloc / Cubit (State Management)\
- Dio (HTTP Client)\
- AutoRoute (Navigation)\
- Freezed (Immutable Models & Union Types)\
- Envied (Environment Variable Management)\
- Clean Architecture

---

## Requirements

### 1. Register

- Fields: `email`, `password`, `confirmPassword`

### 2. Login

- Input: `email`, `password`
- Return: **JWT**
- Token should contain at least:
  - `email`
  - `user id` or similar identifier

### 3. Authenticated View / Endpoint

After successful login, calling the protected route / loading the protected screen should show:

```
Hello [email], welcome back
```

user should be logged out after 15 minutes of inacitvity

---

### 4. Manager wallet

User should be able to see and transfer his money to other user.
fields are: recipient, amount, and notes

## What to deliver

- Fork this repository and then send the link
- A runnable project (any structure).
- README explaining:
  - How to build and run it (prepare docker compose)
  - Required environment variables

---

## Acceptance criteria

- Registration works with validation.
- Login returns a usable JWT.
- A protected route or screen shows the welcome message using JWT auth.
- User able to transfer funds
- Set it up so it can be ran on Docker container with compose for database

---

## Optional bonus

- Docker
- Backend built using Go (or their frameworks)
- Frontend built using Flutter/React Native
- Tests (unit or integration)

This keeps the scope tight: just registration, login, and a protected “Hello [email]” flow.
