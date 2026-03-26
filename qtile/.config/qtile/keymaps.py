from libqtile.config import Key
from libqtile.lazy import lazy

from options import browser, launcher, mod, terminal

keys = [
    # Move focus between windows
    Key(
        [mod],
        "h",
        lazy.layout.left(),
        desc="Move focus to left",
    ),
    Key(
        [mod],
        "l",
        lazy.layout.right(),
        desc="Move focus to right",
    ),
    Key(
        [mod],
        "j",
        lazy.layout.down(),
        desc="Move focus down",
    ),
    Key(
        [mod],
        "k",
        lazy.layout.up(),
        desc="Move focus up",
    ),
    Key(
        [mod],
        "space",
        lazy.layout.next(),
        desc="Move window focus to other window",
    ),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down",
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up",
    ),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        desc="Grow window down",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        desc="Grow window up",
    ),
    Key(
        [mod, "control"],
        "plus",
        lazy.layout.grow(),
        desc="Grow window",
    ),
    Key(
        [mod, "control"],
        "minus",
        lazy.layout.shrink(),
        desc="Shrink window",
    ),
    # Change between layouts
    Key(
        [mod],
        "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts",
    ),
    # Toggle FullScreen Window
    Key(
        [mod, "control"],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    # Toggle Floating Window
    Key(
        [mod, "control"],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    # Launch Various Programs
    Key(
        [mod],
        "Return",
        lazy.spawn(terminal),
        desc="Launch terminal",
    ),
    Key(
        [mod],
        "b",
        lazy.spawn(browser),
        desc="Launch browser",
    ),
    Key(
        [mod],
        "r",
        lazy.spawn(launcher),
        desc="Spawn a command using a prompt widget",
    ),
    # Various Usefull Commands
    Key(
        [mod, "shift"],
        "c",
        lazy.window.kill(),
        desc="Kill the focused window",
    ),
    Key(
        [mod, "control"],
        "r",
        lazy.reload_config(),
        desc="Reload the config",
    ),
    Key(
        [mod, "control"],
        "q",
        lazy.shutdown(),
        desc="Shutdown Qtile",
    ),
    Key(
        [mod],
        "c",
        lazy.spawn("dunstctl close-all"),
        desc="Clear dunst popups",
    ),
    # Audio Control using WirePlumber
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn(
            "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        ),
        desc="Mute/unmute volume",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn(
            "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
        ),
        desc="Lower volume by 5%",
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn(
            "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+",
        ),
        desc="Raise volume by 5%",
    ),
]
