# Publishing Checklist ✓

Use this checklist to ensure you've completed all necessary steps before publishing your fork.

## 📝 Before You Start

- [ ] Have a GitHub account
- [ ] Have an NPM account (sign up at https://www.npmjs.com/signup)
- [ ] Have a Telegram bot token from @BotFather (for testing)

## 🔧 Personalization Steps

- [ ] Update `package.json`:
  - [ ] Change author name and email
  - [ ] Replace `YOUR-USERNAME` with your GitHub username (3 places)
  - [ ] Verify package name is unique (run: `npm view myown-node-telegram-bot-api`)
  
- [ ] Test locally:
  - [ ] Run `npm run build` successfully
  - [ ] Run `npm test` (should pass)
  - [ ] Test with `test-bot-example.js` (optional but recommended)

## 🐙 GitHub Setup (Recommended)

- [ ] Create new GitHub repository named `myown-node-telegram-bot-api`
- [ ] Update git remote:
  ```bash
  git remote remove origin
  git remote add origin https://github.com/YOUR-USERNAME/myown-node-telegram-bot-api.git
  ```
- [ ] Commit your changes:
  ```bash
  git add .
  git commit -m "Initial commit: Custom fork of node-telegram-bot-api"
  ```
- [ ] Push to GitHub:
  ```bash
  git push -u origin master
  ```

## 📦 NPM Publishing Steps

- [ ] Login to NPM:
  ```bash
  npm login
  ```
  
- [ ] Verify you're logged in:
  ```bash
  npm whoami
  ```
  
- [ ] Final build:
  ```bash
  npm run build
  ```
  
- [ ] Publish:
  ```bash
  npm publish --access public
  ```
  
- [ ] Verify publication:
  ```bash
  npm view myown-node-telegram-bot-api
  ```

## ✅ Post-Publishing

- [ ] Test installation in a new project:
  ```bash
  mkdir test-install
  cd test-install
  npm init -y
  npm install myown-node-telegram-bot-api
  ```
  
- [ ] Create a simple test script to verify it works

- [ ] Update your GitHub repository README if needed

- [ ] Share your package! Tell others about it

## 🔄 For Future Updates

When you make changes and want to publish updates:

- [ ] Make your code changes in `src/` directory
- [ ] Build: `npm run build`
- [ ] Test: `npm test`
- [ ] Update version:
  - [ ] `npm version patch` (for bug fixes)
  - [ ] `npm version minor` (for new features)
  - [ ] `npm version major` (for breaking changes)
- [ ] Commit and push to GitHub:
  ```bash
  git push && git push --tags
  ```
- [ ] Publish: `npm publish`

## 🎯 Quick Commands Reference

```bash
# Build project
npm run build

# Run tests
npm test

# Run linter
npm run eslint

# Check NPM login
npm whoami

# Check package details
npm view myown-node-telegram-bot-api

# Update patch version (1.0.0 -> 1.0.1)
npm version patch

# Publish
npm publish --access public
```

## 🆘 Troubleshooting

### Package name already taken?
- Check availability: `npm view myown-node-telegram-bot-api`
- Try alternative names:
  - `your-name-telegram-bot-api`
  - `custom-telegram-bot-api`
  - `enhanced-telegram-bot-api`
  - `your-username-tg-bot-api`

### Not logged in to NPM?
- Run: `npm login`
- Enter username, password, and email
- Verify: `npm whoami`

### Build errors?
- Make sure all dependencies are installed: `npm install`
- Check for syntax errors in your changes
- Try deleting `lib/` folder and rebuild: `npm run build`

### Publishing errors?
- Make sure you're logged in: `npm whoami`
- Check package name is unique
- Ensure version is updated (can't publish same version twice)
- Verify package.json is valid JSON

## 📚 Helpful Resources

- NPM Documentation: https://docs.npmjs.com/
- Semantic Versioning: https://semver.org/
- Original Bot API: https://github.com/yagop/node-telegram-bot-api
- Telegram Bot API Docs: https://core.telegram.org/bots/api

---

**Pro Tip**: Use the `publish-helper.ps1` script to automate many of these steps:
```powershell
.\publish-helper.ps1
```

Good luck with your custom fork! 🚀

