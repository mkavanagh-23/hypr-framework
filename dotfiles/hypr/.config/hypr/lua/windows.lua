local colors = require("lua.theme")
hl.config({
    general = {
        gaps_in = 3, gaps_out = 5, border_size = 2,
        col = { active_border = colors.active_border, inactive_border = colors.inactive_border },
        layout = "dwindle", allow_tearing = false,
    },
    decoration = {
        rounding = 5, active_opacity = 0.8, inactive_opacity = 0.8,
        blur = {
            enabled = true, popups = true, size = 4, passes = 4,
            contrast = 1.1, brightness = 0.8,
            vibrancy = 0.2, vibrancy_darkness = 0.2,
        },
        shadow = {
            enabled = true, range = 2, render_power = 3,
            offset = { 2, 2 }, color = "rgba(000000bb)",
        },
    },
    animations = { enabled = true },
    dwindle = { pseudotile = true, preserve_split = true },
    master = { new_status = "master" },
})
hl.curve("myBezier", { type = "bezier", points = {{0.1, 0.9}, {0.05, 1.05}} })
hl.curve("cubic", { type = "bezier", points = {{0.645, 0.045}, {0.355, 1}} })
hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 15, bezier = "cubic", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default" })
require("lua.windowrules")

