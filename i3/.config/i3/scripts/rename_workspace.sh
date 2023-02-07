name=$(echo "" | rofi -dmenu -theme-str 'listview {enabled: false;} entry {placeholder: "New workspace name";}')
i3-msg rename workspace to \"$name\"
