hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("mako")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("qs -c desktopBar")
    hl.exec_cmd([[sh -c 'sleep 0.9; exec hyprlock']])

    -- If Hyprland starts with the lid already closed,
    -- disable the Framework internal display.
    hl.exec_cmd([[
        sh -c 'sleep 3; grep -q closed /proc/acpi/button/lid/*/state && hyprctl eval '\''hl.monitor({ output = "eDP-1", disabled = true })'\'''
    ]])
end)
