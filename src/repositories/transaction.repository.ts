import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export const findUserById = async (id: string) => {
  return prisma.user.findUnique({ where: { id } });
};

export const findUserByEmail = async (email: string) => {
  return prisma.user.findUnique({ where: { email } });
};

export const transferWithTransaction = async (
  senderId: string,
  recipientId: string,
  amount: number,
  notes?: string
) => {
  return prisma.$transaction([
    prisma.user.update({
      where: { id: senderId },
      data: {
        balance: { decrement: amount },
      },
    }),
    prisma.user.update({
      where: { id: recipientId },
      data: {
        balance: { increment: amount },
      },
    }),
    prisma.transaction.create({
      data: {
        senderId,
        recipientId,
        amount,
        notes,
      },
    }),
  ]);
};

export const findTransactionsByUserId = async (userId: string) => {
  return prisma.transaction.findMany({
    where: {
      OR: [
        { senderId: userId },
        { recipientId: userId },
      ],
    },
    orderBy: {
      createdAt: "desc",
    },
  });
};



