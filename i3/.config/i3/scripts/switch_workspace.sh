#!/bin/bash

workspace=$(i3-msg -t get_workspaces | jq -r ".[] | .name" | rofi -dmenu -i -sort -fuzzy -match fzf)
i3-msg workspace $workspace

