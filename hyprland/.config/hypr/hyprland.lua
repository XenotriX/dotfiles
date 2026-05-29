hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("XKB_DEFAULT_LAYOUT", "real-prog-dvorak") -- This is mostly for gamescope

require("hyprland.animations")
require("hyprland.bindings")
require("hyprland.cursor")
require("hyprland.decoration")
require("hyprland.dunst")
require("hyprland.gestures")
require("hyprland.input")
require("hyprland.layout")
require("hyprland.plover")
require("hyprland.rendering")
require("hyprland.startup")
require("hyprland.window_rules")

-- Machine-specific config (monitors, devices, overrides); optional.
pcall(require, "hyprland.machine")
