hl.bind("SUPER + return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("ALT + l", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("ALT + h", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("SUPER + e", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind("SUPER + f", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + SHIFT + f", hl.dsp.window.fullscreen_state({ internal = -1, client = 2 }))
hl.bind("SUPER + CTRL + r", hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))
hl.bind("SUPER + CTRL + l", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind("SUPER + b", hl.dsp.exec_cmd("rofi-rbw"))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + Tab", hl.dsp.window.cycle_next())
hl.bind("SUPER + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind("SUPER + code:10", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + code:11", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + code:12", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + code:13", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + code:14", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + code:15", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + code:16", hl.dsp.workspace.toggle_special("Obsidian"))
hl.bind("SUPER + code:17", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + code:18", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + code:19", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + code:10", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + code:11", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + code:12", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + code:13", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + code:14", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + code:15", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + code:16", hl.dsp.window.move({ workspace = "special:Obsidian" }))
hl.bind("SUPER + SHIFT + code:17", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + code:18", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }))

-- Rename active workspace
hl.bind("SUPER + m", hl.dsp.exec_cmd("hyprland_workspace_rename"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%- --min-value 10%"), { locked = true })
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind("SUPER + R", hl.dsp.submap("resize")) -- will switch to a submap called resize

hl.define_submap("resize", function() -- will start a submap called "resize"
    hl.bind("l", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
    hl.bind("h", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset")) -- use reset to go back to the global submap
end)

hl.bind("SUPER + s", hl.dsp.submap("screenshot"))

hl.define_submap("screenshot", "reset", function()
    hl.bind("f", hl.dsp.exec_cmd("grimshot copy screen"))
    hl.bind("w", hl.dsp.exec_cmd("grimshot copy window"))
    hl.bind("s", hl.dsp.exec_cmd("grimshot copy area"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)
