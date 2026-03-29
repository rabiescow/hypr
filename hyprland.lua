
-- # Variables
local HOME = /home/anon
local MONITOR = DP-2
local RESOLUTION = 3440x1440@165
local TERMINAL = kitty
local FILEMANAGER = nautilus
local MENU = hyprlauncher
local BATTLENET = ((Diablo IV)|(Battle.net)|(Starcraft 2))
local SCREENRECORDING = ^(.*)obsproject(.*)$

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE","wayland")
hl.env("XDG_SESSION_DESKTOP","Hyprland")
hl.env("XDG_MENU_PREFIX", "arch-")

-- Themes
hl.env("XCURSOR_SIZE", "40")
hl.env("XCUSROR_PATH", "/home/anon/.local/share/icons/")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "40")

-- # Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")

-- # Qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "2")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- # Firefox
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")

-- # Java
hl.env("_JAVA_AWT_WM_NONREPARENTING=1")

-- Other
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("EDITOR", "nvim")

hl.exec_once("wbg --stretch ~/Pictures/wallpapers/takashi-miyazaki-unsplash.jpg")
hl.exec_once("nwg-panel")
hl.exec_once("dunst")
hl.exec_once("steam")
hl.exec_once("otd-daemon")
-- hl.exec_once("eww daemon")
hl.exec_once("wl-paste --type text --watch cliphist store")
hl.exec_once("wl-paste --type image --watch cliphist store")

hl.exec_once("hypridle")
hl.exec_once("~/.config/hypr/scripts/keyboard.sh")
hl.exec_once("~/.config/hypr/scripts/xdg-portal-hyprland")
hl.exec_once("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
hl.exec_once("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_once("systemctl --user start hyprpolkitagent")

hl.monitor({
    output      =   "HDMI-A-1",
    mode        =   "3440x1440@100",
    position    =   "0x0",
    scale       =   "1",
})

hl.bind("SUPER + Q", hl.exec_cmd(TERMINAL))
hl.bind("SUPER + C", hl.window.close())
hl.bind("SUPER + M", hl.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind("SUPER + E", hl.exec_cmd(FILEMANAGER))
hl.bind("SUPER + V", hl.window.float({ action = "toggle" }))
hl.bind("SUPER + R", hl.exec_cmd(MENU))
hl.bind("SUPER + F", hl.window.fullscreen())
hl.bind("SUPER + M", hl.exec_cmd("hyprctl kill"))
hl.bind("SUPER + T", hl.exec_cmd(TERMINAL))

for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,             hl.workspace(i))
    hl.bind("SUPER + SHIFT + " .. key,     hl.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse:272", hl.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("SUPER + Q", hl.exec_cmd(TERMINAL))
