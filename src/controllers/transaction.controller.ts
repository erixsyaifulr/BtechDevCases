import { PrismaClient } from "@prisma/client";
import { Response } from "express";
import { transferBalance, getMyBalance as getMyBalanceService, getMyTransactions } from "../services/transaction.service";

const prisma = new PrismaClient();

export const getMyBalance = async (req: any, res: Response) => {
  try {
    const result = await getMyBalanceService(req.user.id);
    res.json(result);
  } catch (err: any) {
    res.status(400).json({ message: err.message });
  }
};

export const transfer = async (req: any, res: Response) => {
  const { recipient, amount, notes } = req.body;
  const senderId = req.user.id;

  try {
    const result = await transferBalance(
      senderId,
      recipient,
      Number(amount),
      notes
    );

    res.json(result);
  } catch (err: any) {
    res.status(400).json({ message: err.message });
  }
};

export const getMyTransactionHistory = async (req: any, res: Response) => {
  const userId = req.user.id; // from JWT middleware

  const transactions = await getMyTransactions(userId);

  res.json({
    transactions,
  });
};