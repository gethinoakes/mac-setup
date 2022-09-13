function echo_ok { echo -e '\033[1;32m🔥 '"$1"'\033[0m'; }
function echo_warning { echo -e '\033[1;33m⚠️ '" $1"'\033[0m'; }

echo_warning "Configuring git"
# read -p "Setup git for personal or work? [p/w] " -r
# echo
# if [[ $REPLY =~ ^[Pp]$ ]]; then
  git config --global user.name "Gethin Oakes"
  git config --global user.email "gethinoakes@gmail.com"
# else
#   git config --global user.name "Gethin Oakes"
#   git config --global user.email "gethin@paperclip.co"
# fi

echo_ok "Done with git"
