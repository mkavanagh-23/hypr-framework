local p = require("lua.programs")
local m = "SUPER + "
local function exec(key, command, flags)
    hl.bind(key, hl.dsp.exec_cmd(command), flags)
end

-- Program shortcuts
exec(m .. "RETURN", p.terminal)
exec(m .. "SHIFT + RETURN", p.ssh)
hl.bind(m .. "Q", hl.dsp.window.close())
exec(m .. "M", p.system_menu)
exec(m .. "N", "thunderbird")
exec(m .. "SHIFT + M", p.power_menu)
exec(m .. "E", p.fileManager)
--exec(m .. "SHIFT + E", "thunar")
exec(m .. "F", p.browser)
exec(m .. "SHIFT + F", p.browser .. " --private-window")
exec(m .. "Z", p.lock)
exec(m .. "SPACE", p.menu)
exec(m .. "SHIFT + SPACE", p.search)
exec(m .. "D", "discord")
--exec(m .. "T", p.terminal .. ' -e zsh -i -c "tms"')
exec(m .. "SHIFT + T", "$HOME/.scripts/gh-new-repo.sh")
exec("Print", "grimshot --notify savecopy screen", { locked = true })
exec("SHIFT + Print", "grimshot --notify savecopy anything", { locked = true })
exec(m .. "SHIFT + P", "grimshot --notify savecopy screen")
exec(m .. "P", "grimshot --notify savecopy anything")
exec(m .. "SHIFT + H", "killall qs || qs -c desktopBar")
--local shaders = { "none", "dark", "crt", "chromatic", "drugs", "retro", "vhs1", "vhs2", "vhs3" }
--for i, shader in ipairs(shaders) do
--    exec(m .. "CTRL + " .. (i - 1), "$HOME/.scripts/shader-" .. shader .. ".sh", { locked = true })
--end

-- Top bar controls
exec("XF86AudioMute", "pamixer -t", { locked = true })
exec("XF86AudioLowerVolume", "pamixer -d 3", { locked = true, repeating = true })
exec("XF86AudioRaiseVolume", "pamixer -i 3", { locked = true, repeating = true })
exec("XF86AudioPrev", "playerctl previous", { locked = true })
exec("XF86AudioPlay", "playerctl play-pause", { locked = true })
exec("XF86AudioNext", "playerctl next", { locked = true })
exec("XF86MonBrightnessDown", "brightnessctl set 5%- --min-value=1", { locked = true, repeating = true })
exec("XF86MonBrightnessUp", "brightnessctl set +5%", { locked = true, repeating = true })
--exec("XF86RFKill", "/usr/bin/rfkill toggle all", { locked = true, non_consuming = true })
--exec("XF86AudioMedia", "f12 option", { locked = true })

-- Window Management
hl.bind(m .. "Y", hl.dsp.layout("togglesplit"))
hl.bind(m .. "U", hl.dsp.layout("swapsplit"))
hl.bind(m .. "V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(m .. "SHIFT + V", hl.dsp.window.fullscreen_state({ internal = 2, client = 1, action = "set" }))
hl.bind(m .. "CTRL + V", hl.dsp.window.fullscreen({ action = "toggle" }))
local directions = { left = "left", right = "right", up = "up", down = "down",
                     H = "left", J = "down", K = "up", L = "right" }
for key, direction in pairs(directions) do
    hl.bind(m .. key, hl.dsp.focus({ direction = direction }))
end
for i = 1, 10 do
    local key = i % 10
    hl.bind(m .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(m .. "SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(m .. "TAB", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(m .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(m .. "SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(m .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(m .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(m .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(m .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
