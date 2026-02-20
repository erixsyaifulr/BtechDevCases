import { transferWithTransaction, findUserById, findUserByEmail, findTransactionsByUserId } 
from "../repositories/transaction.repository";
import { Messages } from "../utils/messages";

export const getMyBalance = async (userId: string) => {
  const user = await findUserById(userId);

  if (!user) {
    throw new Error(Messages.USER_NOT_FOUND);
  }

  return {
    balance: user.balance,
  };
};

export const transferBalance = async (
  senderId: string,
  recipientEmail: string,
  amount: number,
  notes?: string
) => {
  // Validate amount
  if (!amount || amount <= 0) {
    throw new Error(Messages.AMOUNT_MUST_BE_GREATER_THAN_ZERO);
  }
  // Find sender and recipient
  const sender = await findUserById(senderId);
  if (!sender) {
    throw new Error(Messages.SENDER_NOT_FOUND);
  }

  const recipient = await findUserByEmail(recipientEmail);
  if (!recipient) {
    throw new Error(Messages.RECEIVER_NOT_FOUND);
  }

  if (sender.id === recipient.id) {
    throw new Error(Messages.CANNOT_TRANSFER_TO_YOURSELF);
  }

  if (sender.balance < amount) {
    throw new Error(Messages.INSUFFICIENT_BALANCE);
  }

  // Perform transfer with transaction
  await transferWithTransaction(
    sender.id,
    recipient.id,
    amount,
    notes
  );

  return { message: Messages.TRANSFER_SUCCESS };
};

export const getMyTransactions = async (userId: string) => {
  const transactions = await findTransactionsByUserId(userId);

  return transactions;
};