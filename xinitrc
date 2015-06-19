[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7 &
urxvtd -f
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session fvwm
