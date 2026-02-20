import bcrypt from "bcrypt";

import { createUser, findUserByEmail } from "../repositories/auth.repository";
import { generateToken } from "../utils/jwt";
import { Messages } from "../utils/messages";
import { validatePassword } from "../utils/validation";


export const loginUser = async (email: string, password: string) => {
  const user = await findUserByEmail(email);
  if (!user) throw new Error(Messages.INVALID_CREDENTIALS);

  const valid = await bcrypt.compare(password, user.password);
  if (!valid) throw new Error(Messages.INVALID_CREDENTIALS);
  // Generate JWT
  const token = generateToken({
    id: user.id,
    email: user.email,
  });

  return token;
};

export const registerUser = async (email: string, password: string, confirmPassword: string) => {
  // Validation
  if (!email || !password || !confirmPassword) {
    throw new Error(Messages.ALL_FIELDS_REQUIRED);
  }

  if (password !== confirmPassword) {
    throw new Error(Messages.PASSWORDS_DO_NOT_MATCH);
  }

  // Validate password strength
  if (!validatePassword(password)) {
    throw new Error(Messages.PASSWORD_INVALID);
  }

  // Ceck user if already exists
  const existingUser = await findUserByEmail(email);
  if (existingUser) {
    throw new Error(Messages.USER_ALREADY_EXISTS);
  }

  // Hash password
  const hashed = await bcrypt.hash(password, 10);

  // Create user
  const user = await createUser(email, hashed);

  return user;
};
