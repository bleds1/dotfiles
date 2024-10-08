local wezterm = require 'wezterm';

return {
    color_scheme = "Catppuccin Mocha", -- Mocha, Macchiato, Frappe, Latte
    default_cursor_style = "SteadyBlock",
    cursor_blink_rate = 800,
    -- scrollback_lines = 10000,
    audible_bell = "Disabled",
    window_padding = { left = 0, right = 0, top = 0, bottom = 0, },
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    adjust_window_size_when_changing_font_size = false,
    font_size = 12,
    font = wezterm.font_with_fallback {
      'Ubuntu Mono',
    },
    -- NOTE When not using Catppuccin (above) comment out these for usual color scheme
    -- colors = {
    --     foreground = '#6daad5',
    --     background = '#2a2e3a',
    --     cursor_bg = '#6B95B8',
    --     selection_fg = '#ff92d0',
    --     ansi = {"#22262f", "#ff5555", "#6daad5","#f8ffa8", "#bd93f9", "#ff79c6", "#8be9fd", "#cacaca"},
    --     brights = {"#4d4d4d", "#ff6e67", "#7bbcea", "#f9ffb8", "#caa9fa", "#ff92d0", "#9aedfe", "#ffffff"},

    -- tab_bar = {
    --     background = '#22262f',
    --     active_tab = {
    --         bg_color = '#2a2e3a',
    --         fg_color = '#909090',
    --         italic = true
    --     },
    --     inactive_tab = {
    --         bg_color = '#22262f',
    --         fg_color = '#808080',
    --         italic = true
    --     },
    --     new_tab = {
    --         bg_color = '#22262f',
    --         fg_color = '#808080',
    --         italic = true
    --     },
    --     new_tab_hover = {
    --         bg_color = '#22262f',
    --         fg_color = '#909090'
    --     },
    --     inactive_tab_hover = {
    --         bg_color = '#22262f',
    --         fg_color = '#909090',
    --     }
    -- },
    -- },
    keys = {
    {key="t", mods="CTRL", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
	{key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
	{key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
	{key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
	{key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
	{key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
	{key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
	{key="7", mods="ALT", action=wezterm.action{ActivateTab=5}},
	{key="8", mods="ALT", action=wezterm.action{ActivateTab=5}},
    {key="w", mods="CTRL", action=wezterm.action{CloseCurrentTab={confirm=true}}}, }
}
