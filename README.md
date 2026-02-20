# BTECH Wallet - Flutter App

Flutter Web client for the BTECH Wallet Application.

This application connects to the BTECH Wallet Backend API and provides:

- User Registration
- User Login
- View Total Balance
- Transfer Balance
- Transaction History

---

## Tech Stack

- Flutter
- Bloc / Cubit (State Management)
- Dio (HTTP Client)
- AutoRoute (Navigation)
- Freezed (Immutable Models & Union Types)
- Envied (Environment Variable Management)
- Clean & Modular Architecture

---

## Backend Requirement

⚠️ The backend must be running before starting the Flutter app.

Default backend URL:

http://localhost:3000

Make sure the backend is running (via Docker):

docker compose up --build

---

## How To Run (Recommended: Flutter Web - Chrome)

### 1. Install Dependencies

flutter pub get

### 2. Setup Environment File

The repository only includes:

.env.example

Create your own `.env` file by copying it:

cp .env.example .env

Then update the value if needed:

API_BASE_URL=http://localhost:3000

The `.env` file should NOT be committed to Git.

After running code generation (see below), you may delete the `.env`
file if required for security purposes.

---

### 3. Generate Code (Required for Freezed & Envied)

flutter pub run build_runner build --delete-conflicting-outputs

This step will generate:

- Freezed models
- Envied environment configuration

After successful generation, you can remove the `.env` file if needed.

---

### 4. Run on Chrome

flutter run -d chrome

---

## Android Emulator Note

If running on Android emulator:

baseUrl: "http://10.0.2.2:3000"

---

## Testing Flow

1.  Register a new user
2.  Login
3.  View total balance
4.  Transfer balance
5.  Check transaction history

---

## Important Notes

- Backend must be running before starting the app.
- CORS must be enabled on the backend for web support.
- Code generation is required (Freezed & Envied).
- Only `.env.example` is committed to Git.
- Recommended platform for assessment: **Flutter Web (Chrome)**.

---

## Requirements

- Flutter SDK (3.38.8 or latest stable recommended)
- Google Chrome
- Running Backend API
