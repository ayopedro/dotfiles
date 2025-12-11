# Create .bashrc_custom
@"
# Custom Bashrc for Codespaces

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment variables
export EDITOR='code --wait'
export VISUAL='code --wait'

# Color support
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# History settings
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups

# Append to history instead of overwriting
shopt -s histappend

# Welcome message
echo '🚀 Welcome to your personalized Codespace!'
echo '📁 Workspace: '$(pwd)
echo '🔧 Dotfiles loaded successfully'
echo ''
"@ | Out-File -FilePath .bashrc_custom -Encoding utf8