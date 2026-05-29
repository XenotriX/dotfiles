hl.config({
    gestures = {
        workspace_swipe_forever = true,
        workspace_swipe_create_new = false,
        workspace_swipe_direction_lock = false,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "special", workspace_name = "Obsidian" })
