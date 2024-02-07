echo "this operate will recover your dotfile! [y/N]"
read -k 1 -r REPLY
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

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
