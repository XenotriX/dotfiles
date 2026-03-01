up() {
  local current_dir dirs full_path
  current_dir=$(pwd)

  IFS='/' dirs=(${(s:/:)current_dir})

  paths=()
  full_path=""
  for i in {1..${#dirs[@]}}; do
    if [ "$i" -ne 1 ]; then
      full_path="${full_path}${dirs[$i-1]}/"
    else
      full_path="/${dirs[$i-1]}"
    fi
    paths+=("$full_path")
  done

  selected_path=$(printf "%s\n" "${paths[@]}" | sort -rn | fzf)

  if [ -n "$selected_path" ]; then
    cd "$selected_path"
  fi
}
