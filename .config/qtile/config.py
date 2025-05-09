# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# autostart imports
import os
import subprocess

# qtile imports
from libqtile import layout, hook
from libqtile.config import Match, Group


# config imports
import keymaps
import screeninfo
import options

colorScheme = options.colorScheme


# Hook that runs upon startup, calls the autostart.sh script
@hook.subscribe.startup_once
def start_once():
    autostart = os.path.expanduser('~/.config/qtile/Scripts/autostart.sh')
    subprocess.Popen([autostart])


# Get remaps for the keyboard from keymaps.py
keys = keymaps.initKeymaps()


# Get remaps for the mouse from keymaps.py
mouse = keymaps.initMouseMaps()


# Set Up groups
groups = []

group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_labels = [" ", " ", "󱓟 ", " ", " ", "󰣘 ", " ", "󱎃 ", " "]
group_layouts = ["monadthreecol", "max", "max", "max", "max", "max", "max", "max", "max"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        )
    )

# Append the keymaps for switching between different window groups
keys.extend(keymaps.setUpVirtualDesktopSwitching(groups))


# Define default themes for layouts
layoutTheme = {
    "border_width": 1,
    "border_focus": colorScheme[8],
    "border_normal": colorScheme[0],
    "margin": 12
}


# Define active layouts
layouts = [
    layout.Max(**layoutTheme),
    layout.MonadThreeCol(
        **layoutTheme,
        main_centered=True,
        new_client_position="bottom",
        ratio=0.50
    ),

    # Try more layouts by unleashing below layouts.
    # layout.MonadTall(**layoutTheme),
    # layout.MonadWide(**layoutTheme),
    # layout.Stack(**layoutTheme, num_stacks=2),
    # layout.Bsp(**layoutTheme),
    # layout.Matrix(**layoutTheme),
    # layout.RatioTile(**layoutTheme),
    # layout.Tile(**layoutTheme),
    # layout.TreeTab(**layoutTheme),
    # layout.VerticalTile(**layoutTheme),
    # layout.Zoomy(**layoutTheme),
    # layout.Columns(**layoutTheme, border_focus_stack=["#d75f5f", "#8f3d3d"]),
]

widget_defaults = screeninfo.initWidgetDefaults()
extension_defaults = widget_defaults.copy()


screens = screeninfo.initScreens()


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="dk.sdu.mmmi.cbse.main.Main"),
        Match(wm_class="dk.vkp.cbse.engine.App"),
        Match(wm_class="Emerald Edgers"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
