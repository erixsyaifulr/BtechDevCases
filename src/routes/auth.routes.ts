import { Router } from "express";
import { login, register } from "../controllers/auth.controller";
import { authMiddleware } from "../middleware/auth.middleware";

const router = Router();

router.post("/register", register);
router.post("/login", login);

router.get("/me", authMiddleware, (req: any, res) => {
  res.json({
    data: `Hello ${req.user.email}, welcome back`,
  });
});

export default router;
