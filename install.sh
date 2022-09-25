rm install.sh
cd ~
rm -f .vimrc
rm -rf .vim
curl -O https://raw.githubusercontent.com/juljus/vim-config/main/.vimrc
mkdir -p .vim/autoload/
cd .vim/autoload/
curl -O https://raw.githubusercontent.com/juljus/vim-config/main/.vim/autoload/plug.vim
cd ~
