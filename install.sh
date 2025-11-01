#!/bin/bash

echo "================================"
echo "Installing vim configuration..."
echo "================================"

# Clean up old config
cd ~
rm -f .vimrc
rm -rf .vim

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
