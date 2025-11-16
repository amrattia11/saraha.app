import { Router } from 'express';
import userRoutes from './user.routes.js';
import messageRoutes from './message.routes.js';

const router = Router({ caseSensitive: true, strict: false, mergeParams: true });

router.use('/users', userRoutes);
router.use('/messages', messageRoutes);

export default router;
