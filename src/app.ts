import express from "express";
import dotenv from "dotenv";
import authRoutes from "./routes/auth.routes";
import transactionRoutes from "./routes/transaction.routes";
import { Messages } from "./utils/messages";

dotenv.config();

const app = express();

app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    message: Messages.WELCOME_MESSAGE
  });
});

app.use("/auth", authRoutes);
app.use("/transaction", transactionRoutes);

app.use((err: any, req: any, res: any, next: any) => {
  console.error(err);
  res.status(500).json({
    message: Messages.INTERNAL_ERROR,
    error: err.message
  });
});


export default app;
