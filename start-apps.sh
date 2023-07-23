# here are things i for some reason dont put into my .xinitrc

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xmodmap -e 'clear Lock'
~/.fehbg
polybar &
picom & 
dunst &
syncthing &
python3 ~/tools/02_figures/inkscapefigures/main.py &
python3 ~/tools/03_shortcuts/main.py &
echo "no course selected" > /tmp/current_course
