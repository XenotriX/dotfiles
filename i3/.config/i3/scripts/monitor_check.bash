get_mon_count() {
    xrandr -q | grep ' connected' | wc -l
}

last_count=-1

while true;
do
    sleep 1
    mon_count=$(get_mon_count)
    if [ "$last_count" = "$mon_count" ]; then
        continue;
    fi

    if [ "$mon_count" = 2 ]; then
        xrandr --output DP-0 --auto --left-of eDP-1-1
        i3-msg restart
        echo "Second monitor connected"
    else
        xrandr --output DP-0 --off
        i3-msg restart
        echo "Second monitor disconnected"
    fi
    last_count=$mon_count
done
