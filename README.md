# BTECH Wallet App API

Node.js + TypeScript + Prisma + PostgreSQL + Docker

---

## Overview

BTECH Wallet App is a RESTful API that implements a simple digital
wallet system.

Features include:

- User Registration
- User Login with JWT Authentication
- Protected Routes
- Wallet Balance Management
- Secure Fund Transfer
- Transaction History
- Dockerized setup with PostgreSQL

JWT tokens expire after **15 minutes** to enforce inactivity logout.

---

## Tech Stack

- Node.js
- TypeScript
- Express
- Prisma ORM
- PostgreSQL
- JWT (JSON Web Token)
- bcrypt (Password hashing)
- Docker & Docker Compose

---

## Architecture

Project structure follows a layered architecture pattern:

    src/
     ├── controllers/
     ├── services/
     ├── repositories/
     ├── middlewares/
     ├── routes/
     ├── utils/
     └── app.ts

Flow:

Controller → Service → Repository → Prisma → Database

---

# Features

---

## 1. User Registration

### Endpoint

POST `/auth/register`

### Request Body

```json
{
  "email": "user@example.com",
  "password": "Password123!",
  "confirmPassword": "Password123!"
}
```

### Behavior

- Validates email & password
- Password is hashed using bcrypt
- New user automatically receives:

Initial balance: 100000

---

## 2. User Login

### Endpoint

POST `/auth/login`

### Request Body

```json
{
  "email": "user@example.com",
  "password": "Password123!"
}
```

### Response

```json
{
  "token": "JWT_TOKEN"
}
```

### JWT Details

- Contains user id and email
- Expires in 15 minutes (900 seconds)

---

## 3. Get Authenticated User

### Endpoint

GET `/auth/me`

### Header

Authorization: Bearer `<token>`{=html}

### Response

Hello user@example.com, welcome back

---

## 4. Check Wallet Balance

### Endpoint

GET `/transaction/balance`

### Header

Authorization: Bearer `<token>`{=html}

---

## 5. Transfer Money

### Endpoint

POST `/transaction/transfer`

### Header

Authorization: Bearer `<token>`{=html}

### Request Body

```json
{
  "recipient": "other@example.com",
  "amount": 50000,
  "notes": "Lunch payment"
}
```

### Rules

- Cannot transfer if insufficient balance
- Cannot transfer to self
- Transfer executed inside a database transaction
- Both sender and recipient balances are updated atomically

---

## 6. Transaction History

### Endpoint

GET `/transaction/history`

### Header

Authorization: Bearer `<token>`{=html}

Returns list of transfers (sent and received).

---

# Prerequisites

Make sure you have installed:

- Docker Desktop
- Docker Compose
- Git

Verify installation:

docker --version docker compose version

---

# Installation Guide (Docker)

## 1. Clone Repository

clone this repository, then cd btech-wallet-app

## 2. Run Application

docker compose up --build

This will:

- Build Node.js container
- Start PostgreSQL container
- Run Prisma migrations
- Start API server

## 3. Access Application

Server runs at:

http://localhost:3000

---

# Environment Variables

Configured inside docker-compose.yml

DATABASE_URL=postgresql://postgres:postgres@db:5432/walletdb\
JWT_SECRET=supersecret

If running without Docker, create a .env file:

DATABASE_URL=postgresql://postgres:postgres@localhost:5432/walletdb\
JWT_SECRET=supersecret

---

# Run Without Docker (Development Mode)

1.  Install dependencies

npm install

2.  Setup environment variables in .env

3.  Run Prisma migration

npx prisma migrate dev

4.  Start development server

npm run dev

---

# Database

- PostgreSQL 15
- Prisma ORM
- Prisma migrations used for schema management
- Docker volume persists database data

---

# Security Notes

- Passwords are hashed using bcrypt
- JWT authentication with 15-minute expiration
- Database transactions ensure safe balance updates
- Input validation applied for all endpoints

---

# Acceptance Criteria Checklist

- ✅ Registration works with validation\
- ✅ Login returns a usable JWT\
- ✅ JWT expires after 15 minutes\
- ✅ Protected route returns welcome message\
- ✅ User can transfer funds\
- ✅ Transfer uses database transaction\
- ✅ Dockerized setup with PostgreSQL\
- ✅ Database migration works\
- ✅ Clean layered architecture

---
