hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0.0 })
hl.layer_rule({ match = { namespace = "rofi" }, animation = "slide bottom" })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })

hl.window_rule({ match = { class = "obsidian" }, workspace = "special:Obsidian silent" })
hl.window_rule({ match = { class = "firefox", title = "Picture-in-Picture" }, float = true })
hl.window_rule({ match = { title = "SnakeGA" }, float = true })
hl.window_rule({ match = { title = "SnakeGA" }, center = true })
hl.window_rule({ match = { title = "SnakeGA" }, rounding = 0 })
hl.window_rule({ match = { class = "firefox", title = "Picture-in-Picture" }, persistent_size = true })
hl.window_rule({ match = { class = "firefox", title = "Picture-in-Picture" }, pin = true })

-- [Godot] Remove decorations from the integrated game window
hl.window_rule({ match = { initial_title = "Godot", float = true }, decorate = false })

-- [Plover] Pin windows
hl.window_rule({ match = { class = "Plover", float = true }, pin = true })

-- [FreeCad] Fix dragging issues
hl.window_rule({ match = { class = "FreeCAD" }, no_initial_focus = true })
