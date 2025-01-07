from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from libqtile.config import Click, Drag

# Import options to set options
import options


mod = options.modKey
terminal = options.terminalCommand
browser = options.browserCommand
launcher = options.runLauncher


def initKeymaps():
    keyMaps = [
        # Move focus between windows
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod, "control"], "plus", lazy.layout.grow(), desc="Grow window"),
        Key([mod, "control"], "minus", lazy.layout.shrink(), desc="Shrink window"),

        # Change between layouts
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

        # Toggle FullScreen Window
        Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),

        # Toggle Floating Window
        Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

        # Launch Various Programs
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
        Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
        Key([mod], "r", lazy.spawn(launcher), desc="Spawn a command using a prompt widget"),

        # Various Usefull Commands
        Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill the focused window"),
        Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    ]

    return keyMaps


def initMouseMaps():
    mouseMaps = [
        # Drag floating layouts.
        Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front()),
    ]

    return mouseMaps


def setUpVirtualDesktopSwitching(groups):
    groupMaps = []
    for i in groups:
        groupMaps.extend(
            [
                # mod1 + group number = switch to group
                Key([mod], i.name, lazy.group[i.name].toscreen(),
                    desc="Switch to group {}".format(i.name)),

                # mod1 + shift + group number = switch to & move focused window to group
                Key([mod, "shift"], i.name, lazy.window.togroup(i.name,
                    switch_group=False),
                    desc="Switch to & move focused window to group {}".format(i.name)),
            ]
        )

    return groupMaps
