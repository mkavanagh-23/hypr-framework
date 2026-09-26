-- Disable transpaency for apps
for _, class in ipairs({
    "kitty", "org.kde.dolphin", "com.mitchellh.ghostty", "mpv", "discord",
    "virt-manager", "com.hypixel.HytaleLauncher", "HytaleClient", "zen",
}) do
    local rule = { match = { class = "^(" .. class:gsub("%.", "\\.") .. ")$" },
                   opacity = "1.0 override 1.0 override" }
    if class == "zen" then rule.focus_on_activate = false end
    hl.window_rule(rule)
end

-- Application window rules
hl.window_rule({ match = { class = "^(galculator)$" }, float = true, size = {400, 600} })
hl.window_rule({ match = { class = "^(zenity)$" }, float = true, border_size = 0 })
hl.window_rule({ match = { title = "^(iheartcams)$" }, float = true, size = {600, 300} })
hl.window_rule({ match = { title = "^(.*Network Manager.*)$" }, float = true })
for _, class in ipairs({ "soh.elf", "2s2h.elf" }) do
    hl.window_rule({ match = { class = "^(" .. class:gsub("%.", "\\.") .. ")$" }, fullscreen = true })
end
for _, namespace in ipairs({ "waybar", "quickshell" }) do
    hl.layer_rule({ match = { namespace = namespace }, blur = true, ignore_alpha = 0, blur_popups = true })
end
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0.1, dim_around = true })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "zen" }, blur_popups = true })

-- Gapless fullscreen, borders with multiple windows
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
for _, workspace in ipairs({ "w[tv1]", "f[1]" }) do
    hl.window_rule({ match = { float = false, workspace = workspace }, border_size = 0, rounding = 0 })
end
