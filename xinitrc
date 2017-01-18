[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7 &
urxvtd -f

case "$1" in

i3)
	echo 'i3'
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
	;;

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
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
# for a verbose output in a logfile just append this to previous line
#	-V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
	;;
esac

