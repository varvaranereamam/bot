# Quick Start - Your Custom Fork

## ✅ Setup Complete!

Your fork of `node-telegram-bot-api` is ready! Here's what's been done:

### Files Modified:
- ✅ `package.json` - Updated with new package name and version
- ✅ `README.md` - Updated with installation instructions
- ✅ Built the project successfully

### Current Package Details:
- **Package Name**: `myown-node-telegram-bot-api`
- **Version**: `1.0.0`
- **Description**: Telegram Bot API - Custom Fork with Personal Adaptations

## 🚀 Quick Publishing Steps

### 1. Personalize Your Fork
```bash
# Edit package.json and update:
# - "author": "Your Name <your-email@example.com>"
# - Replace "YOUR-USERNAME" in repository URLs with your GitHub username
```

### 2. Test Locally (Optional but Recommended)
```bash
npm test
npm link
```

### 3. Create GitHub Repository
1. Go to https://github.com/new
2. Create repo: `myown-node-telegram-bot-api`
3. Run these commands:
```bash
git remote remove origin
git remote add origin https://github.com/YOUR-USERNAME/myown-node-telegram-bot-api.git
git add .
git commit -m "Initial fork with custom adaptations"
git push -u origin master
```

### 4. Publish to NPM
```bash
# Login to NPM (first time only)
npm login

# Check if name is available
npm view myown-node-telegram-bot-api

# Publish your package
npm publish --access public
```

## 🎯 Now You Can Install It Anywhere!

Once published, in any project:
```bash
npm install myown-node-telegram-bot-api
```

And use it:
```javascript
const TelegramBot = require('myown-node-telegram-bot-api');

const token = 'YOUR_BOT_TOKEN';
const bot = new TelegramBot(token, {polling: true});

bot.onText(/\/start/, (msg) => {
  bot.sendMessage(msg.chat.id, 'Hello from your custom fork!');
});
```

## 📝 Making Custom Changes

1. Edit files in `src/` directory
2. Build: `npm run build`
3. Test: `npm test`
4. Update version: `npm version patch`
5. Publish: `npm publish`

## 📖 For More Details

See `FORK_GUIDE.md` for comprehensive instructions on:
- Version management
- GitHub setup
- Testing locally
- Maintaining your fork
- Best practices

---

**Need help?** Check out:
- [NPM Publishing Guide](https://docs.npmjs.com/packages-and-modules/contributing-packages-to-the-registry)
- [Original node-telegram-bot-api Documentation](https://github.com/yagop/node-telegram-bot-api)
