from libqtile import bar
import libqtile
from libqtile.config import Screen

from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration
import subprocess

# Import options to set general options for screen
import options


colorScheme = options.colorScheme


def initScreens():
    widgetList = initWidgets()
    if not options.displayBattery:
        del widgetList[14:15]
    screenList = [
        Screen(
            top=bar.Bar(
                widgetList,
                size=22,
                background=[colorScheme[0]]
            ),
        ),
    ]

    return screenList


def initWidgetDefaults():
    widget_defaults = dict(
        font="UbuntuMono Nerd Font",
        fontsize=12,
        padding=4,
        )

    return widget_defaults


def initWidgets():
    # Define powerline format
    powerline = {
        "decorations": [
            PowerLineDecoration(path="forward_slash")
            ]
        }

    # Define widget list
    widgetList = [
        widget.Spacer(length=4),
        libqtile.widget.Image(
            filename="~/.config/qtile/Assets/archlinux-icon-crystal-128.png",
            scale="False",
            margin=1,
            ),
        widget.GroupBox(
            active=colorScheme[7],
            highlight_method="line",
            inactive=colorScheme[3],
            rounded=True,
            this_current_screen_border=colorScheme[6],
            this_screen_border=colorScheme[6],
            other_current_screen_border=colorScheme[4],
            other_screen_border=colorScheme[4],
            urgent_alert_method="block",
            urgent_border=colorScheme[9],
            urgent_text=colorScheme[9],
            ),
        widget.Sep(
            padding=8,
            foreground=colorScheme[3],
            ),
        widget.CurrentLayoutIcon(
            scale=0.95,
            ),
        widget.Sep(
            padding=8,
            foreground=colorScheme[3],
            ),
        widget.Spacer(
            length=bar.STRETCH,
            **powerline
            ),
        widget.GenPollText(
            background=colorScheme[8],
            foreground=colorScheme[2],
            func=lambda: subprocess.check_output("whoami", shell=True, text=True).strip(),
            fmt="  | {}",
            **powerline,
            ),
        widget.CPU(
            background=colorScheme[9],
            foreground=colorScheme[2],
            format="  | {load_percent}% / {freq_current}GHz",
            **powerline
            ),
        widget.Memory(
            background=colorScheme[7],
            foreground=colorScheme[2],
            format="  | {MemUsed:.0f} {mm} / {MemTotal:.0f} {mm}",
            **powerline
            ),
        widget.Net(
            background=colorScheme[6],
            foreground=colorScheme[2],
            format="  | {down:6.2f}     {up:6.2f}",
            interface=options.netInterface,
            **powerline
            ),
        widget.Clock(
            background=colorScheme[11],
            foreground=colorScheme[2],
            format="%Y-%m-%d %a %I:%M %p",
            **powerline
            ),
        widget.KeyboardLayout(
            background=colorScheme[0],
            foreground=colorScheme[2],
            configured_keyboards=['us', 'dk'],
            fmt="  {}",
            ),
        widget.Volume(
            background=colorScheme[0],
            foreground=colorScheme[2],
            fmt=" {}",
            mute_format=" ",
            **powerline
            ),
        widget.Battery(
            background=colorScheme[0],
            foreground=colorScheme[2],
            charge_char="󰂄",
            discharge_char="󰂌",
            empty_char="󰂃",
            full_char="󰁹",
            not_charging_char="󰂃",
            low_foreground=colorScheme[9],
            format="{char} {percent:2.0%} | {watt:.2f} W",
            **powerline
            ),
        widget.Systray(
            background=colorScheme[1],
            ),
    ]

    return widgetList
