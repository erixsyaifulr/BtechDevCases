import { Router } from "express";
import { authMiddleware } from "../middleware/auth.middleware";
import { getMyBalance, getMyTransactionHistory, transfer } from "../controllers/transaction.controller";

const router = Router();

router.get("/balance", authMiddleware, getMyBalance);
router.post("/transfer", authMiddleware, transfer);
router.get("/history", authMiddleware, getMyTransactionHistory);

export default router;
