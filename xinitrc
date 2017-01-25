# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest version	https://github.com/pygospa/dotfiles


# Set DPI (can be calculated using https://www.sven.de/dpi/)
xrandr --dpi 81.59

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7 &
urxvtd -f

case "$1" in
i3)
	echo 'i3'
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
	;;
*)
	echo 'standard'
	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
	# for a verbose output into logfile use this line instead:
#	exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
	;;
esac

