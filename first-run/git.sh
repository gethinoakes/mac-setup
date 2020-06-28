#########
## GIT ##
#########
echo_warn "Configure git"
read -p "Setup git for personal or work? [p/w] " -r
echo
if [[ $REPLY =~ ^[Pp]$ ]]; then
  git config --global user.name "Gethin Oakes"
  git config --global user.email "gethinoakes@gmail.com"
else
  git config --global user.name "Gethin Oakes"
  git config --global user.email "gethin@paperclip.co"
fi

echo_ok "Done with git"
