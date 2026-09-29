-- Framework internal display
hl.monitor({
    output = "eDP-1",
    mode = "2880x1920@120",
    position = "1840x1440",
    scale = 1.5,
})

-- Acer 2 - left external
-- Serial: 2536015715W01
hl.monitor({
    output = "desc:Acer Technologies KGB271U X1 2536015715W01",
    mode = "2560x1440@144",
    position = "0x0",
    scale = 1,
})

-- Acer 1 - right external
-- Serial: 45280269A4204
hl.monitor({
    output = "desc:Acer Technologies KGB271U X1 45280269A4204",
    mode = "2560x1440@143.91",
    position = "2560x0",
    scale = 1,
})

-- Fallback
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

-- Lid closed: disable Framework display
hl.bind(
    "switch:on:Lid Switch",
    hl.dsp.exec_cmd(
        [[hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })']]
    ),
    { locked = true }
)

-- Lid opened: restore Framework display
hl.bind(
    "switch:off:Lid Switch",
    hl.dsp.exec_cmd(
        [[hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = false, mode = "2880x1920@120", position = "1840x1440", scale = 1.5 })']]
    ),
    { locked = true }
)
