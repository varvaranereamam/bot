# Guide to Publishing Your Custom Fork

This guide will help you publish your custom fork of `node-telegram-bot-api` as `myown-node-telegram-bot-api`.

## ✅ What's Already Done

1. ✅ Cloned the original `node-telegram-bot-api` repository
2. ✅ Updated `package.json` with your custom package name
3. ✅ Updated `README.md` to reflect the fork
4. ✅ Installed all dependencies

## 📝 Next Steps to Customize

### 1. Update Author Information

Edit `package.json` and replace:
```json
"author": "Your Name <your-email@example.com>"
```

With your actual name and email.

### 2. Update Repository URLs

Edit `package.json` and replace `YOUR-USERNAME` with your actual GitHub username in these fields:
- `repository.url`
- `bugs.url`
- `homepage`

### 3. Make Your Custom Adaptations

Now you can make any modifications you want to the code! The main source code is in:
- `src/telegram.js` - Main bot class
- `src/` - Other source files
- `examples/` - Example usage files

After making changes, build the project:
```bash
npm run build
```

## 🚀 Publishing to NPM

### Step 1: Create an NPM Account

If you don't have one, go to [npmjs.com](https://www.npmjs.com/signup) and create an account.

### Step 2: Login to NPM

```bash
npm login
```

Enter your username, password, and email when prompted.

### Step 3: Check Package Name Availability

Before publishing, verify the name is available:
```bash
npm view myown-node-telegram-bot-api
```

If you get a 404 error, the name is available! If not, choose a different name.

### Step 4: Build the Project

```bash
npm run build
```

### Step 5: Publish Your Package

For the first time:
```bash
npm publish --access public
```

For subsequent updates:
1. Update the version in `package.json` (following [semantic versioning](https://semver.org/))
2. Run: `npm publish`

## 🔄 Version Management

When you make changes and want to publish updates:

```bash
# For bug fixes (1.0.0 -> 1.0.1)
npm version patch

# For new features (1.0.0 -> 1.1.0)
npm version minor

# For breaking changes (1.0.0 -> 2.0.0)
npm version major

# Then publish
npm publish
```

## 🐙 GitHub Repository Setup

### Step 1: Create a New GitHub Repository

1. Go to [GitHub](https://github.com/new)
2. Create a new repository named `myown-node-telegram-bot-api`
3. Don't initialize with README (we already have one)

### Step 2: Update Remote Origin

```bash
# Remove the old origin
git remote remove origin

# Add your new repository
git remote add origin https://github.com/YOUR-USERNAME/myown-node-telegram-bot-api.git

# Push to your repository
git push -u origin master
```

## 🧪 Testing Your Fork Locally

Before publishing, you can test your fork locally:

### In this project:
```bash
npm run build
npm test
```

### In another project:
```bash
# Link your package locally
cd /path/to/your/fork
npm link

# In your test project
cd /path/to/test-project
npm link myown-node-telegram-bot-api
```

Then in your test project:
```javascript
const TelegramBot = require('myown-node-telegram-bot-api');
// Test your bot...
```

## 📦 Using Your Published Package

Once published, anyone (including you) can install it:

```bash
npm install myown-node-telegram-bot-api
```

Or with a specific version:
```bash
npm install myown-node-telegram-bot-api@1.0.0
```

## 🛠️ Development Workflow

1. Make changes to the code in `src/`
2. Build: `npm run build`
3. Test: `npm test`
4. Commit your changes: `git commit -am "Description of changes"`
5. Update version: `npm version patch` (or minor/major)
6. Push to GitHub: `git push && git push --tags`
7. Publish to NPM: `npm publish`

## ⚠️ Important Notes

1. **Keep it legal**: The original package is MIT licensed, so you're free to fork and modify it. Just keep the original license and give credit to the original authors.

2. **Choose a unique name**: If `myown-node-telegram-bot-api` is taken, choose another name. Try variations like:
   - `your-name-telegram-bot-api`
   - `custom-telegram-bot-api`
   - `enhanced-telegram-bot-api`

3. **Maintain your fork**: Consider periodically syncing with the original repository to get bug fixes and new features:
   ```bash
   # Add original repo as upstream
   git remote add upstream https://github.com/yagop/node-telegram-bot-api.git
   
   # Fetch updates
   git fetch upstream
   
   # Merge updates (be careful with conflicts)
   git merge upstream/master
   ```

## 📚 Useful Commands

```bash
# Build the project
npm run build

# Run tests
npm test

# Run linter
npm run eslint

# Generate documentation
npm run doc

# Check what will be published
npm pack --dry-run

# View your published package
npm view myown-node-telegram-bot-api
```

## 🎉 You're All Set!

Your fork is now ready to be customized and published. Make your changes, test them thoroughly, and share your enhanced version with the world!

## 📞 Support

If you need help with the original API, refer to the [original documentation](https://github.com/yagop/node-telegram-bot-api).

For NPM publishing issues, check out the [NPM documentation](https://docs.npmjs.com/packages-and-modules/contributing-packages-to-the-registry).

