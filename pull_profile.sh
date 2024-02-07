git pull
echo "this operate will recover your dotfile! [y/N]"
read -p "" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

cp proxy.sh /bin/proxy.sh
cp -r .bashrc ~
cp -r .tmux.conf ~
cp -r .vimrc ~
cp -r .yarnrc ~
cp -r .zshrc ~
cp -r .oh-my-zsh ~
cp -r .tmux ~

