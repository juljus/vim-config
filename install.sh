#!/bin/bash

echo "================================"
echo "Installing vim configuration..."
echo "================================"

cd ~

# Backup old config
if [ -f .vimrc ]; then
  echo "[!] Backing up old .vimrc to .vimrc.bak"
  mv .vimrc .vimrc.bak
fi

if [ -d .vim ]; then
  echo "[!] Backing up old .vim to .vim.bak"
  mv .vim .vim.bak
fi

# Download main vimrc
echo "[+] Downloading .vimrc..."
curl -O https://raw.githubusercontent.com/juljus/vim-config/main/.vimrc

# Create vim directories
echo "[+] Setting up directories..."
mkdir -p .vim/autoload
mkdir -p .vim/undo

# Download vim-plug
echo "[+] Downloading vim-plug..."
cd .vim/autoload
curl -O https://raw.githubusercontent.com/juljus/vim-config/main/.vim/autoload/plug.vim

# Download CoC settings
echo "[+] Downloading CoC settings..."
cd ..
curl -O https://raw.githubusercontent.com/juljus/vim-config/main/.vim/coc-settings.json

cd ~

echo "[+] Installation complete!"
echo "[+] Next steps:"
echo "   1. Open vim: vim"
echo "   2. Run: :PlugInstall"
echo "   3. Run: :CocInstall <lang>"
echo "      :CocInstall coc-pyright      (Python)"
echo "      :CocInstall coc-clangd       (C/C++)"
echo "      :CocInstall coc-tsserver     (TypeScript/JavaScript)"
echo "   4. Restart vim"
