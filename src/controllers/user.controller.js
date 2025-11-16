import crypto from 'crypto';
import User from '../models/User.js';
import Message from '../models/Message.js';
import ResponseHelper from '../utils/ResponseHelper.js';
import asyncWrapper from '../utils/asyncWrapper.js';

export const registerAccount = asyncWrapper(async (req, res) => {
  const { username, email } = req.body;
  const accessToken = crypto.randomBytes(24).toString('hex');
  const account = await User.create({
    username: username.toLowerCase(),
    email,
    manageToken: accessToken
  });
  return res.status(201).json(ResponseHelper.success('Account registered', {
    id: account._id,
    username: account.username,
    email: account.email,
    manageToken: account.manageToken,
    createdAt: account.createdAt
  }));
});

export const fetchProfile = asyncWrapper(async (req, res) => {
  const { username } = req.params;
  const account = await User.findOne({ username: username.toLowerCase() });
  if (!account) return res.status(404).json(ResponseHelper.error('Account not found'));
  const count = await Message.countDocuments({ user: account._id });
  return res.json(ResponseHelper.success('Account profile', {
    id: account._id,
    username: account.username,
    email: account.email || null,
    createdAt: account.createdAt,
    messageCount: count
  }));
});

