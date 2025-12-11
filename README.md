# 🛠️ Dotfiles

My personal development environment configuration for GitHub Codespaces.

## 🚀 Quick Setup

### 1. Fork This Repository

Click the **Fork** button at the top of this page to create your own copy. This ensures you have control over your dotfiles and my changes won't affect your setup.

### 2. Configure GitHub Settings

1. Go to your **GitHub Settings**: https://github.com/settings/codespaces
2. Scroll to the **Dotfiles** section
3. Check **✓ Automatically install dotfiles**
4. Select **your forked repository**: `your-username/dotfiles`
5. (Optional) Specify the install script path: `install.sh`

That's it! Every new Codespace you create will automatically apply these configurations from your fork.

## 📦 What's Included

- **`.bashrc`** - Bash shell configuration
- **`.bash_aliases`** - Custom command aliases
- **`.gitconfig`** - Git configuration
- **`.vscode/settings.json`** - VS Code settings
- **`install.sh`** - Automated installation script

## 🔧 Manual Installation

If you need to manually install in an existing Codespace:

```bash
bash ~/dotfiles/install.sh
```

## 📝 Notes

- Settings are applied automatically when creating new Codespaces
- Changes to this repo will affect future Codespaces (not existing ones)
- For project-specific configurations, use `.devcontainer/devcontainer.json` in your project repos