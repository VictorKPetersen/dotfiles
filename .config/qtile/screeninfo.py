from libqtile import bar, widget
from libqtile.config import Screen


def initScreens(colorScheme):
    screenList = [
        Screen(
            top=bar.Bar(
                initWidgetsMainScreen(colorScheme),
                size=18,
                background=["#000000d0", colorScheme[0]+"a0"]
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


def initWidgets(colorScheme):
    widgetList = [
        widget.Spacer(length=4),
        widget.Image(
            filename="~/.config/qtile/Assets/archlinux-icon-crystal-128.svg",
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
        widget.Spacer(length=bar.STRETCH),
        widget.CPU(),
        widget.Memory(),
        widget.KeyboardLayout(
            configured_keyboards=['dk'],
        ),
        # widget.Volume(),
        widget.Sep(
            padding=8,
            foreground=colorScheme[3]
        ),
        widget.Systray(),
        widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
    ]

    return widgetList


def initWidgetsMainScreen(colorScheme):
    widgetMain = initWidgets(colorScheme)
    return widgetMain


def initWidgetSecondaryScreen(colorScheme):
    widgetSecondary = initWidgets(colorScheme)
    # Uncomments below and specifiy widgets to be deleted
    # Eg. systray
    # del widgetSecondary[]
    return widgetSecondary
