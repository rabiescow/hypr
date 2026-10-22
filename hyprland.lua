-- hl = {}

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_MENU_PREFIX", "arch-")

hl.env("XCURSOR_SIZE", 40)
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_PATH", "/home/anon/.local/share/icons/")
hl.env("HYPRCURSOR_SIZE", 40)
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", 2)
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("MOZ_ENABLE_WAYLAND", 1)
hl.env("MOZ_DISABLE_RDD_SANDBOX", 1)
hl.env("_JAVA_AWT_WM_NONREPARENTING", 1)
hl.env("WLR_NO_HARDWARE_CURSORS", 1)
hl.env("EDITOR", "nvim")
hl.env("TERM", "xterm-ghostty")
hl.env("HYPRSHOT_DIR", "~/Pictures/screenshots/")

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.on("hyprland.start", function()
	hl.exec_cmd(
		"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE"
	)
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	hl.exec_cmd("hypridle")

	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	hl.exec_cmd("wbg --stretch ~/Pictures/wallpapers/anime-cyber-bright-eyes.jpg")
	hl.exec_cmd("nwg-panel")
	hl.exec_cmd("dunst")

	hl.dsp.focus({ workspace = 8 })
	hl.exec_cmd("steam")
end)

hl.monitor({
	output = "HDMI-A-1",
	mode = "3440x1440@100",
	position = "0x0",
	scale = 1,
})

hl.config({
	input = {
		kb_layout = "us_rabd,us,se",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		kb_file = "",

		numlock_by_default = true,
		-- resolve_binds_by_sim = false,

		repeat_rate = 25,
		repeat_delay = 600,
		sensitivity = 0,
		-- accel_profile = ""
		force_no_accel = false,
		rotation = 0,
		left_handed = false,
		scroll_points = "0.2 0.0 0.5 1 1.2 1.5",
		scroll_method = "2fg",
		scroll_button = 0,
		scroll_button_lock = false,
		scroll_factor = 1.0,
		natural_scroll = false,
		follow_mouse = 2,
		follow_mouse_threshold = 0.0,
		focus_on_close = 0,
		mouse_refocus = true,
		float_switch_override_focus = 1,
		special_fallthrough = false,
		off_window_axis_events = 1,
		-- emulate_descrete_scroll = 1,
	},

	general = {
		border_size = 2,
		gaps_in = 5,
		gaps_out = 10,
		float_gaps = 5,
		gaps_workspaces = 0,
		layout = "slidr",
		no_focus_fallback = false,
		resize_on_border = false,
		extend_border_grab_area = 15,
		hover_icon_on_border = true,
		allow_tearing = false,
		resize_corner = 0,
		modal_parent_blocking = true,
		locale = "en_US",
		col = {
			active_border = { colors = { "rgba(fffab387)", "rgba(ffa6e3a1)" }, angle = 45 },
			inactive_border = { colors = { "rgba(99585b70)", "rgba(99b4befe)" }, angle = 45 },
			nogroup_border = { colors = { "rgba(99585b70)", "rgba(99b4befe)" }, angle = 45 },
			-- nogroup_border_inactive = { colors = { "rgba(99585b70)", "rgba(99b4befe)" }, angle = 45 },
		},
		snap = {
			enabled = true,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = false,
			respect_gaps = false,
		},
	},

	decoration = {
		rounding = 10,
		rounding_power = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,

		dim_modal = true,
		dim_inactive = true,
		dim_strength = 0.05,
		dim_special = 0.2,
		dim_around = 0.4,

		-- screen_shader =
		border_part_of_window = true,

		-- # https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 1,
			passes = 2,
			ignore_opacity = true,
			new_optimizations = true,
			xray = true,
			noise = 0.0117,
			contrast = 0.9,
			brightness = 0.4,
			vibrancy = 0.1696,
			vibrancy_darkness = 0.0,
			special = false,
			popups = false,
			popups_ignorealpha = 0.2,
			input_methods = false,
			input_methods_ignorealpha = 0.2,
		},

		shadow = {
			enabled = true,
			range = 10,
			render_power = 9,
			sharp = false,
			color = 0x11111bee,
			color_inactive = 0x181825ee,
			offset = { 5, 5 },
			scale = 1.0,
		},
	},

	-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
	dwindle = {
		force_split = 2,
		preserve_split = true,
		smart_split = false,
		smart_resizing = true,
		permanent_direction_override = false,
		special_scale_factor = 1,
		split_width_multiplier = 1.0,
		use_active_for_splits = true,
		default_split_ratio = 1.0,
		split_bias = 0,
	},

	master = {
		new_status = "master",
		allow_small_split = false,
		special_scale_factor = 0.3,
		mfact = 0.35,
		orientation = "center",
		smart_resizing = false,
		new_on_top = false,
	},

	misc = {
		disable_hyprland_logo = false,
		disable_splash_rendering = false,
		disable_scale_notification = false,
		col = { splash = 0xffffffff },
		font_family = "Victor Mono",
		splash_font_family = "Victor Mono",
		force_default_wallpaper = 2,
		vrr = 0,
		mouse_move_enables_dpms = false,
		key_press_enables_dpms = false,
		always_follow_on_dnd = true,
		name_vk_after_proc = true,
		layers_hog_keyboard_focus = true,
		animate_manual_resizes = false,
		animate_mouse_windowdragging = false,
		disable_autoreload = false,
		enable_swallow = false,
		swallow_regex = "^.*(kitty).*$",
		swallow_exception_regex = "^.*(kitty).*$",
		focus_on_activate = false,
		mouse_move_focuses_monitor = true,
		allow_session_lock_restore = false,
		session_lock_xray = true,
		background_color = 0xff1e1e2e,
		close_special_on_empty = true,
		on_focus_under_fullscreen = 2,
		exit_window_retains_fullscreen = false,
		initial_workspace_tracking = 2,
		middle_click_paste = false,
		render_unfocused_fps = 15,
		disable_xdg_env_checks = false,
		lockdead_screen_delay = 1000,
		enable_anr_dialog = true,
		anr_missed_pings = 3,
		size_limits_tiled = false,
		disable_watchdog_warning = false,
	},

	xwayland = {
		enabled = true,
		use_nearest_neighbor = true,
		force_zero_scaling = false,
		create_abstract_socket = false,
	},

	opengl = {
		nvidia_anti_flicker = true,
	},

	render = {
		direct_scanout = 0,
		expand_undersized_textures = true,
		xp_mode = false,
		ctm_animation = 2,
		-- cm_fs_passthrough = 2,
		cm_enabled = true,
		send_content_type = true,
		cm_auto_hdr = 2,
		new_render_scheduling = true,
		non_shader_cm = 3,
		cm_sdr_eotf = 0,
	},

	cursor = {
		invisible = false,
		sync_gsettings_theme = true,
		no_hardware_cursors = 2,
		no_break_fs_vrr = 2,
		min_refresh_rate = 24,
		hotspot_padding = 1,
		inactive_timeout = 0,
		no_warps = false,
		persistent_warps = false,
		warp_on_change_workspace = 0,
		warp_on_toggle_special = 0,
		-- default_monitor = $MONITOR,
		zoom_factor = 1.0,
		zoom_rigid = false,
		zoom_detached_camera = true,
		enable_hyprcursor = true,
		hide_on_key_press = true,
		hide_on_touch = true,
		hide_on_tablet = true,
		use_cpu_buffer = 2,
		warp_back_after_non_mouse_input = false,
		zoom_disable_aa = false,
	},

	ecosystem = {
		no_update_news = false,
		enforce_permissions = false,
	},
	debug = {
		overlay = false,
		damage_blink = false,
		disable_logs = true,
		disable_time = true,
		damage_tracking = 2,
		enable_stdout_logs = false,
		manual_crash = 0,
		suppress_errors = false,
		-- watchdog_timeout = 5,
		disable_scale_checks = false,
		error_limit = 5,
		error_position = 0,
		colored_stdout_logs = true,
		pass = false,
		full_cm_proto = false,
	},

	group = {
		auto_group = true,
		insert_after_current = true,
		focus_removed_window = true,
		drag_into_group = 1,
		merge_groups_on_drag = true,
		merge_groups_on_groupbar = true,
		merge_floated_into_tiled_on_groupbar = false,
		group_on_movetoworkspace = true,
		col = {
			border_active = 0x66ffff00,
			border_inactive = 0x66777700,
			border_locked_active = 0x66ff5500,
			border_locked_inactive = 0x66775500,
		},

		groupbar = {
			enabled = true,
			font_family = "Victor Mono",
			font_size = 12,
			font_weight_active = "normal",
			font_weight_inactive = "normal",
			gradients = true,
			height = 20,
			indicator_gap = 0,
			indicator_height = 3,
			stacked = false,
			priority = 3,
			render_titles = true,
			text_offset = 0,
			scrolling = true,
			rounding = 1,
			gradient_rounding = 2,
			round_only_edges = true,
			gradient_round_only_edges = true,
			text_color = 0xffcdd6f4,
			col = {
				active = 0x66ffff00,
				inactive = 0x66777700,
				locked_active = 0x66ff5500,
				locked_inactive = 0x66775500,
			},
			gaps_in = 2,
			gaps_out = 2,
			keep_upper_gap = true,
		},
	},

	binds = {
		pass_mouse_when_bound = false,
		scroll_event_delay = 300,
		workspace_back_and_forth = false,
		hide_special_on_workspace_change = false,
		allow_workspace_cycles = false,
		workspace_center_on = 0,
		focus_preferred_method = 0,
		ignore_group_lock = false,
		movefocus_cycles_fullscreen = false,
		movefocus_cycles_groupfirst = false,
		disable_keybind_grabbing = false,
		window_direction_monitor_fallback = true,
		allow_pin_fullscreen = false,
		drag_threshold = 0,
	},

	quirks = {
		prefer_hdr = 2,
	},
})

-- hl.gesture({
-- 	workspace_swipe_distance = 300,
-- 	workspace_swipe_touch = false,
-- 	workspace_swipe_invert = true,
-- 	workspace_swipe_touch_invert = false,
-- 	workspace_swipe_min_speed_to_force = 30,
-- 	workspace_swipe_cancel_ratio = 0.5,
-- 	workspace_swipe_create_new = true,
-- 	workspace_swipe_direction_lock = true,
-- 	workspace_swipe_direction_lock_threshold = 10,
-- 	workspace_swipe_forever = false,
-- 	workspace_swipe_use_r = false,
-- })

hl.device({
	name = "compx-epomaker-carbonx",
	sensitivity = -0.5,
})
hl.device = {
	name = "pulsar-feinmann-8k-dongle",
	sensitivity = -0.5,
	accel_profile = "flat",
	-- other per-device options
}
-- hl.device({
-- 	name = "compx-epomaker-carbonx",
-- 	sensitivity = -0.5,
-- })

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.1, 0.3 }, { 0.1, 0.9 } } })
hl.curve("easeInCubic", { type = "bezier", points = { { 0.6, 0.1 }, { 0.7, 0.2 } } })
hl.curve("easeInBack", { type = "bezier", points = { { 0.6, -0.3 }, { 0.75, 0.1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

local terminal = "kitty"
local main_mod = "SUPER"

hl.bind(main_mod .. " + Q", hl.dsp.exec_raw("kitty"))
hl.bind(main_mod .. " + C", hl.dsp.window.close())
hl.bind(main_mod .. " + E", hl.dsp.exec_raw("nautilus"))
hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(
	main_mod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(main_mod .. " + N", hl.dsp.exec_cmd("numnum"))
-- hl.bind(main_mod .. " + W", hl.dsp.exec_cmd("waifuland"))
-- hl.bind(main_mod .. " + SHIFT + W", hl.dsp.exec_cmd("kill (pidof waifuland)"))

hl.bind("CTRL + " .. main_mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind("CTRL + " .. main_mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind("CTRL + " .. main_mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind("CTRL + " .. main_mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + SHIFT + TAB", hl.dsp.focus({ direction = "right" }))
hl.bind("ALT + TAB", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + TAB", hl.dsp.focus({ last = true }))
-- hl.bind(main_mod .. " + TAB", hl.dsp.focus({ workspace = "prev" }))

-- hl.bind("CTRL + TAB", hl.dsp.exec_cmd("~/.config/eww/bash/toggle_workspaces.sh"))

for i = 1, 10 do
	local key = i % 10
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("F4", hl.dsp.focus({ workspace = 994 }))
hl.bind("SHIFT + F4", hl.dsp.window.move({ workspace = 994 }))
hl.bind("F5", hl.dsp.focus({ workspace = 995 }))
hl.bind("SHIFT + F5", hl.dsp.window.move({ workspace = 995 }))
hl.bind("F6", hl.dsp.focus({ workspace = 996 }))
hl.bind("SHIFT + F6", hl.dsp.window.move({ workspace = 996 }))
hl.bind("F7", hl.dsp.focus({ workspace = 997 }))
hl.bind("SHIFT + F7", hl.dsp.window.move({ workspace = 997 }))
hl.bind("F8", hl.dsp.focus({ workspace = 998 }))
hl.bind("SHIFT + F8", hl.dsp.window.move({ workspace = 998 }))

-- Example special workspace (scratchpad)
hl.bind(main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_raw("hyprshot -m output -o $HYPRSHOT_DIR"))
hl.bind(main_mod .. " + PRINT", hl.dsp.exec_raw("hyprshot -m window -o $HYPRSHOT_DIR"))
hl.bind(main_mod .. " + SHIFT + PRINT", hl.dsp.exec_raw("hyprshot -m region -o $HYPRSHOT_DIR"))

hl.on("hyprland.start", function()
	hl.exec_cmd("dbis-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("wbg --stretch ~/Pictures/wallpapers/takashi-miyazaki-unsplash.jpg")
	hl.exec_cmd("nwg-panel")
	hl.exec_cmd("dunst")
	hl.exec_cmd("steam")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("otd-daemon")
	hl.exec_cmd("eww daemon")
end)
