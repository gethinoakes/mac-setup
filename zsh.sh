function echo_ok { echo -e '\033[1;32m🔥 '"$1"'\033[0m'; }
function echo_warning { echo -e '\033[1;33m⚠️ '" $1"'\033[0m'; }

# Installs .oh-my-zsh
echo_ok "Installing Oh-My-ZSH and plugins"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Assumes default ZSH installation
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Installs plugins
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fix permissions
chmod 700 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo_warn "Now run nano .zshrc to add plugins to .zshrc file (zsh-nvm zsh-autosuggestions,zsh-syntax-highlighting) and then continue with setup"