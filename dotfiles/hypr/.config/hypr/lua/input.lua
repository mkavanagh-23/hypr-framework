hl.config({ input = {
    kb_layout = "us",
    kb_options = "caps:escape_shifted_capslock",
    follow_mouse = 1,
    sensitivity = 0.5,
    touchpad = {
        natural_scroll = true,
        clickfinger_behavior = true,
        tap_to_click = true,
    },
} })
-- The old device rule was for a Logitech G305; harmless if absent.
hl.device({ name = "logitech-g305-1", sensitivity = 0 })
