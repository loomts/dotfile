read -p "this operate will recover your dotfile! [y/N]" reply
case $reply in 
(Y|y)
	;;	
(*)
	exit;;
esac

git pull
cp proxy.sh /bin/proxy.sh
cp -r .bashrc ~
cp -r .tmux.conf ~
cp -r .vimrc ~
cp -r .yarnrc ~
cp -r .zshrc ~
cp -r .oh-my-zsh ~
cp -r .tmux ~

