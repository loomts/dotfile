cp ~/.bashrc .
cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.yarnrc .
cp ~/.zshrc .
rsync -r --exclude='~/.oh-my-zsh/.git' ~/.oh-my-zsh .
rsync -r --exclude='~/.tmux/.git' ~/.tmux .
