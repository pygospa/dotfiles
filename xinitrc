[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7 &
urxvtd -f

case "$1" in

awesome)
	echo 'Awesome'
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome
	;;
fvwm)
	echo 'fvwm'
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session fvwm
	;;
*)
	echo 'standard'
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session fvwm
	;;
esac

