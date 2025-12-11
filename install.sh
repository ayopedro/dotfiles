#!/bin/bash

echo "🔧 Setting up your personalized environment..."

# Debug: Show where we are
echo "Current directory: $(pwd)"
echo "Home directory: $HOME"
echo "Dotfiles should be at: $HOME/dotfiles"

# Check if dotfiles directory exists
if [ ! -d "$HOME/dotfiles" ]; then
    echo "❌ Dotfiles directory not found at $HOME/dotfiles"
    echo "This script should be run from the dotfiles directory or dotfiles should be in HOME"
    exit 1
fi

# Backup existing configs
backup_if_exists() {
    if [ -f "$1" ]; then
        echo "📦 Backing up existing $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

# Link dotfiles
link_dotfile() {
    DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    source_file="$DOTFILES_DIR/$1"
    target_file="$HOME/$1"
    
    if [ -f "$source_file" ]; then
        backup_if_exists "$target_file"
        echo "🔗 Linking $1"
        ln -sf "$source_file" "$target_file"
    else
        echo "⚠️  $source_file not found, skipping"
    fi
}

# Link all dotfiles
link_dotfile ".gitconfig"
link_dotfile ".bash_aliases"

# Append custom bashrc to existing .bashrc
if [ -f "$HOME/dotfiles/.bashrc_custom" ]; then
    echo "✨ Adding custom bashrc settings"
    
    # Check if already added (to avoid duplicates)
    if ! grep -q "Custom settings from dotfiles" ~/.bashrc 2>/dev/null; then
        echo "" >> ~/.bashrc
        echo "# Custom settings from dotfiles" >> ~/.bashrc
        cat "$HOME/dotfiles/.bashrc_custom" >> ~/.bashrc
        echo "✅ Custom bashrc settings added"
    else
        echo "ℹ️  Custom bashrc settings already present"
    fi
else
    echo "⚠️  .bashrc_custom not found, skipping"
fi

echo "✅ Dotfiles setup complete!"
echo "🎉 Your environment is ready!"
echo ""
echo "To apply changes, run: source ~/.bashrc"
