local terminal = "ghostty"
local lock = "loginctl lock-session"
return {
    terminal = terminal,
    fileManager = terminal .. " -e yazi",
    menu = "rofi --term=" .. terminal .. " -i -show drun -show-icons",
    browser = "zen-browser",
    lock = lock,
    system_menu = "~/.scripts/systemmenu.sh",
    power_menu = "~/.scripts/powermenu.sh",
    search = "~/.scripts/google-search.sh",
    ssh = "rofi -show ssh -theme oldworld-yellow",
}
