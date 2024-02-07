read -p "this operate will recover your dotfile! [y/N]" reply
case $reply in
(Y|y)
  ;;
(*)
  exit;;
esac

cp /bin/proxy.sh .
cp ~/.bashrc .
cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.yarnrc .
cp ~/.zshrc .
rsync -r --exclude='.git' ~/.oh-my-zsh .
rsync -r --exclude='.git' --exclude='resurrect' ~/.tmux .

git add .
git commit -m "wsl backup `date +'%Y-%m-%d %H-%M-%S'`"
git push
