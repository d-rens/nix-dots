exec bspwm
sxhkd
picom
[[ -f ~/.config/X/.Xmodmap ]] && xmodmap ~/.config/X/.Xmodmap
xmodmap -e 'clear Lock'
~/.fehbg
polybar &
picom & 
dunst &
syncthing &
python3 ~/tools/02_figures/inkscapefigures/main.py &
python3 ~/tools/03_shortcuts/main.py &
echo "ncs" > /tmp/current_course
