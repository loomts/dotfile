cp ~/.bashrc .
cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.yarnrc .
cp ~/.zshrc .
rsync -r --exclude='.git' ~/.oh-my-zsh .
rsync -r --exclude='.git' ~/.tmux .
