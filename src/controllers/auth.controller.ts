import { Request, Response } from "express";

import { Messages } from "../utils/messages";
import { loginUser, registerUser } from "../services/auth.service";

// Funtion for user registration, it checks for required fields, password confirmation, hashes the password and creates a new user in the database.
export const register = async (req: Request, res: Response) => {
  const { email, password, confirmPassword } = req.body;

  try {
    const user = await registerUser(email, password, confirmPassword);
    res.json({ message: Messages.USER_REGISTERED, user });
  } catch (err: any) {
    res.status(400).json({ message: err.message });
  }
};

// Function for user login, it checks for the user existence, compares the password and generates a JWT token if valid.
export const login = async (req: Request, res: Response) => {
  const { email, password } = req.body;
  try {
    const token = await loginUser(email, password);
    res.json({ token });
  } catch (err: any) {
    res.status(400).json({ message: err.message });
  }
};
