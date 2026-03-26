from libqtile import bar, widget
from libqtile.config import Screen

from options import custom_color, show_battery

widget_defaults = dict(
    font="UbuntuMono Nerd Font",
    fontsize=12,
    padding=4,
)
extension_defaults = widget_defaults.copy()

battery_widget = [
    widget.Battery(
        background=custom_color[0],
        foreground=custom_color[2],
        charge_char="󰂄",
        discharge_char="󰂌",
        empty_char="󰂃",
        full_char="󰁹",
        not_charging_char="󰂃",
        low_foreground=custom_color[9],
        format="{char} {percent:2.0%} | {watt:.2f} W",
    ),
] if show_battery else []

widget_list = [
    widget.GroupBox(
        active=custom_color[7],
        highlight_method="line",
        inactive=custom_color[3],
        rounded=True,
        this_current_screen_border=custom_color[6],
        this_screen_border=custom_color[6],
        other_current_screen_border=custom_color[4],
        other_screen_border=custom_color[4],
        urgent_alert_method="block",
        urgent_border=custom_color[9],
        urgent_text=custom_color[9],
    ),
    widget.CurrentLayout(
        mode="icon",
    ),
    widget.Spacer(
        length=bar.STRETCH,
    ),
    widget.Clock(
        background=custom_color[0],
        foreground=custom_color[2],
        format="%Y-%m-%d %a %I:%M %p",
    ),
    widget.KeyboardLayout(
        background=custom_color[0],
        foreground=custom_color[2],
        configured_keyboards=["us", "dk"],
        fmt="  {}",
    ),
    widget.Volume(
        background=custom_color[0],
        foreground=custom_color[2],
        fmt=" {}",
        mute_format=" ",
    ),
    *battery_widget,
    widget.Systray(),
]

screens = [
    Screen(
        top=bar.Bar(
            widget_list,
            size=22,
            background=[
                custom_color[0],
            ],
        ),
    )
]
