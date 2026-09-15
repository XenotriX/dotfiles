local default_border = "rgba(ffffffaa)"

hl.config({
    general = {
        -- borders
        border_size = 1,
        col = {
            active_border = default_border,
            inactive_border = "rgba(2a2a2a80)",
        },

        -- gaps
        gaps_in = 6,
        gaps_out = 12,
        gaps_workspaces = 50,
    },

    decoration = {
        rounding = 8,
        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            ignore_opacity = true,
            xray = false,
        },

        shadow = {
            enabled = true,
            range = 25,
            render_power = 3,
            color = "rgba(00000044)",
            color_inactive = "rgba(00000022)",
        },
    },
})

hl.on("keybinds.submap", function(name)
    if name == "resize" then
        hl.config({
            general = {
                col = {
                    active_border = "rgba(255, 165, 0, 0.8)",
                },
            },
        })
        -- Force refocus to update the border color immediately
        hl.dispatch(hl.dsp.focus({ window = hl.get_active_window() }))
    else
        hl.config({
            general = {
                col = {
                    active_border = default_border,
                },
            },
        })
        -- Force refocus to update the border color immediately
        hl.dispatch(hl.dsp.focus({ window = hl.get_active_window() }))
    end
end)
