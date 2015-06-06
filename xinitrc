[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -f
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session fvwm

