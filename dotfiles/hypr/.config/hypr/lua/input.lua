hl.config({
  input = {
    kb_layout = "us",
    kb_options = "caps:escape_shifted_capslock",
    follow_mouse = 1,
    sensitivity = 0.5,
    touchpad = {
        natural_scroll = true,
        clickfinger_behavior = true,
        tap_to_click = true,
    },

    gestures = {
      workspace_swipe_distance = 500,
    },
} })

hl.device({
  name = "logitech-g305-1",
  sensitivity = 0 ,
})

-- 3-finger L/R - switch workspace
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- 3-finger up - fullscreen
hl.gesture({
  fingers = 3,
  direction = "up",
  action = "fullscreen",
})

-- 3-finger down - maximize
hl.gesture({
  fingers = 3,
  direction = "down",
  action = "fullscreen",
  args = "maximize",
})

-- 3-finger pinch in - make floating
hl.gesture({
  fingers = 3,
  direction = "pinchin",
  action = "float",
  args = "float",
})

-- 3-finger pinch out - tile
hl.gesture({
  fingers = 3,
  direction = "pinchout",
  action = "float",
  args = "tile",
})
