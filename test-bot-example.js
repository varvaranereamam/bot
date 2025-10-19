/**
 * Simple example to test your custom fork locally
 * 
 * Before running:
 * 1. Get a bot token from @BotFather on Telegram
 * 2. Replace 'YOUR_BOT_TOKEN' below with your actual token
 * 3. Run: node test-bot-example.js
 */

const TelegramBot = require('./index.js');

// Replace with your actual bot token from @BotFather
const token = 'YOUR_BOT_TOKEN';

// Create a bot instance with polling
const bot = new TelegramBot(token, { polling: true });

console.log('Bot started! Send /start to your bot on Telegram');

// Handle /start command
bot.onText(/\/start/, (msg) => {
  const chatId = msg.chat.id;
  bot.sendMessage(chatId, 'Hello! I\'m running on your custom fork of node-telegram-bot-api! 🚀');
});

// Handle /help command
bot.onText(/\/help/, (msg) => {
  const chatId = msg.chat.id;
  const helpMessage = `
Available commands:
/start - Start the bot
/help - Show this help message
/echo <text> - Echo back your text
/custom - Test custom feature

This bot is powered by: myown-node-telegram-bot-api
  `;
  bot.sendMessage(chatId, helpMessage);
});

// Handle /echo command
bot.onText(/\/echo (.+)/, (msg, match) => {
  const chatId = msg.chat.id;
  const text = match[1];
  bot.sendMessage(chatId, `You said: ${text}`);
});

// Handle /custom command (you can add your custom logic here!)
bot.onText(/\/custom/, (msg) => {
  const chatId = msg.chat.id;
  bot.sendMessage(chatId, '🎉 This is where you can add your custom features!');
});

// Handle any message (that doesn't match commands)
bot.on('message', (msg) => {
  // Only respond to messages that aren't commands
  if (!msg.text || msg.text.startsWith('/')) return;
  
  const chatId = msg.chat.id;
  console.log(`Received message from ${msg.from.first_name}: ${msg.text}`);
  
  // You can add custom message processing here
});

// Handle errors
bot.on('polling_error', (error) => {
  console.error('Polling error:', error.code, error.message);
});

console.log('Bot is running... Press Ctrl+C to stop');

