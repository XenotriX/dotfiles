hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.25, 0.46 }, { 0.45, 0.94 } } })
hl.curve("myBezierSpring", { type = "bezier", points = { { 0.34, 1.15 }, { 0.64, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "myBezierSpring", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "layers", enabled = true, speed = 4, bezier = "myBezierSpring", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "myBezier" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "myBezier" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "myBezier", style = "slidefadevert -50%" })
