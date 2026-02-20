import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export const createUser = async (email: string, password: string) => {
  return await prisma.user.create({
    data: {
      email,
      password,
    },
    select: {
      id: true,
      email: true,
      balance: true,
      createdAt: true,
    },
  });
};

export const findUserByEmail = async (email: string) => {
  return await prisma.user.findUnique({
    where: { email },
  });
};

