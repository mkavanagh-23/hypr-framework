require("lua.theme")
require("lua.windows")
require("lua.input")
require("lua.monitors")
require("lua.keybinds")
require("lua.startup")

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = false,
        force_default_wallpaper = 0,
        background_color = 0x161617,
        focus_on_activate = false,
    },
    debug = { suppress_errors = true },
})
