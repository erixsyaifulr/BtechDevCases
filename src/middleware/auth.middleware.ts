import { Request, Response, NextFunction } from "express";
import { verifyToken } from "../utils/jwt";
import { Messages } from "../utils/messages";

export const authMiddleware = (req: any, res: Response, next: NextFunction) => {
  const header = req.headers.authorization;

  if (!header) return res.status(401).json({ message: Messages.UNAUTHORIZED });

  const token = header.split(" ")[1];

  try {
    const decoded = verifyToken(token);
    req.user = decoded;
    next();
  } catch (error) {
    return res.status(401).json({ message: Messages.TOKEN_EXPIRED_OR_INVALID });
  }
};
