from typing import List  # noqa: F401
import os
import subprocess
from os import path

from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, ScratchPad, DropDown, Key, Match, Screen
from libqtile.lazy import lazy
from settings.path import qtile_path
import colors

mod = "mod4"
terminal = "kitty"

autostart = [
        "setxkbmap latam",
        "xrandr --output eDP-1 --mode 1920x1080 --scale 0.75x0.75",
        "picom &",
        #"feh -bg--fill Imágenes/wallpapers/img1.jpg",
        #"picom &",
        ]

for x in autostart:
    os.system(x)


keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "m", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod], "space", lazy.spawn("rofi -show drun"), desc="Launch rofi"),
    Key([mod], "o", lazy.hide_show_bar("top"), desc="hide bar"),
    
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "x", lazy.spawn("bash /home/david/.config/rofi/scripts/powermenu_t2"), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    #Control de Volumen
    Key([], "XF86AudioLowerVolume", lazy.spawn("bash /home/david/.config/qtile/scripts/volume.sh down"), desc="Bajar Volumen"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("bash /home/david/.config/qtile/scripts/volume.sh up"), desc="Subir Volumen"),
    Key([], "XF86AudioMute", lazy.spawn("bash /home/david/.config/qtile/scripts/volume.sh mute"), desc="Mute Volumen"),

    # Control de brillo
    Key([], "XF86MonBrightnessUp", lazy.spawn("bash /home/david/.config/qtile/scripts/brightness-control.sh up"), desc="Subir Brillo"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("bash /home/david/.config/qtile/scripts/brightness-control.sh down"), desc="Bajar Brillo"),

    #Captura de pantalla
    Key([], "print", lazy.spawn("scrot -s"), desc="Captura de pantalla"),
    Key([mod], "Print", lazy.spawn("scrot"), desc="Subir Volumen"),

]

# Create labels for groups and assign them a default layout.
groups = []

group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

#group_labels = ["", "", "", "", "", "", "", "", "ﭮ", ""]
group_labels = ["", "", "", "", "", "", "", "", "", ""]

group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

# Add group names, labels, and default layouts to the groups object.
for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

# Add group specific keybindings
for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Mod + number to move to that group."),
        Key(["mod1"], "Tab", lazy.screen.next_group(),
            desc="Move to next group."),
        Key(["mod1", "shift"], "Tab", lazy.screen.prev_group(),
            desc="Move to previous group."),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            desc="Move focused window to new group."),
    ])

# Define scratchpads
groups.append(ScratchPad("scratchpad", [
    DropDown("term", "kitty --class=scratch", width=0.8, height=0.8, x=0.1, y=0.1, opacity=1),
    DropDown("ranger", "kitty --class=ranger -e ranger", width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    DropDown("volume", "kitty --class=volume -e pulsemixer", width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    DropDown("mus", "kitty --class=mus -e ncmpcpp", width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    DropDown("news", "kitty --class=news -e newsboat", width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),

]))

# Scratchpad keybindings
keys.extend([
    Key([mod], "n", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod], "c", lazy.group['scratchpad'].dropdown_toggle('ranger')),
    Key([mod], "v", lazy.group['scratchpad'].dropdown_toggle('volume')),
    Key([mod], "m", lazy.group['scratchpad'].dropdown_toggle('mus')),
    Key([mod], "b", lazy.group['scratchpad'].dropdown_toggle('news')),
])

colors, backgroundColor, foregroundColor, workspaceColor, chordColor = colors.custom()

# Define layouts and layout themes
layout_theme = {
        "margin":8,
        "border_width": 0,
        "border_focus": colors[2],
        "border_normal": backgroundColor
    }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Floating(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme)
]

# Mouse callback functions
def launch_menu():
    qtile.cmd_spawn("rofi -show drun -show-icons")


# Define Widgets
widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize = 16,
    padding = 2,
    background=backgroundColor
)



def init_widgets_list(monitor_num):
    widgets_list = [
        widget.TextBox(
            text = "  ",
            fontsize = 20,
            font = "JetBrainsMono Nerd Font",
            foreground = colors[7],
        ),
        widget.Sep(
            linewidth = 1,
            padding = 10,
            foreground = colors[5],
            background = backgroundColor
        ),
        widget.GroupBox(
            font="JetBrainsMono Nerd Font",
            fontsize = 16,
            margin_y = 2,
            margin_x = 4,
            padding_y = 6,
            padding_x = 6,
            borderwidth = 2,
            disable_drag = True,
            active = colors[4],
            inactive = foregroundColor,
            hide_unused = True,
            rounded = False,
            highlight_method = "line",
            highlight_color = [backgroundColor, backgroundColor],
            this_current_screen_border = colors[5],
            this_screen_border = colors[7],
            other_screen_border = colors[6],
            other_current_screen_border = colors[6],
            urgent_alert_method = "line",
            urgent_border = colors[9],
            urgent_text = colors[1],
            foreground = foregroundColor,
            background = backgroundColor,
            use_mouse_wheel = False
        ),
        widget.Sep(
            linewidth = 1,
            padding = 20,
            foreground = colors[5],
            background = backgroundColor
        ),
        widget.Sep(
            linewidth = 0,
            padding = 5
        ),
        widget.TaskList(
            icon_size = 0,
            font = "JetBrainsMono Nerd Font",
            foreground = colors[5],
            background = colors[2],
            borderwidth = 0,
            border = colors[1],
            margin = 0,
            padding = 8,
            highlight_method = "block",
            title_width_method = "uniform",
            urgent_alert_method = "border",
            urgent_border = colors[1],
            rounded = False,
            txt_floating = "🗗 ",
            txt_maximized = "🗖 ",
            txt_minimized = "🗕 ",
        ),
         widget.Sep(
            linewidth = 0,
            padding = 10
        ),
        widget.Sep(
            linewidth = 1,
            padding = 10,
            foreground = colors[5],
            background = backgroundColor
        ),
        widget.Sep(
            linewidth = 0,
            padding = 10
        ),
        widget.TextBox(
            text = " ",
            fontsize = 16,
            font = "JetBrainsMono Nerd Font",
            foreground = colors[7],
        ),
        widget.CPU(
            font = "JetBrainsMono Nerd Font",
            update_interval = 1.0,
            format = '{load_percent}%',
            foreground = foregroundColor,
            padding = 5
        ),
        widget.Sep(
            linewidth = 0,
            padding = 10
        ),
        widget.TextBox(
            text = "",
            fontsize = 18,
            font = "JetBrainsMono Nerd Font",
            foreground = colors[3],
        ),
        widget.Memory(
            font = "JetBrainsMono Nerd Font",
            foreground = foregroundColor,
            format = '{MemUsed: .0f}{mm}/{MemTotal:.0f}{mm}',
            measure_mem='G',
            padding = 5,
        ),
        widget.Sep(
            linewidth = 0,
            padding = 10
        ),
        widget.TextBox(
            text = "󰂏 ",
            fontsize = 18,
            font = "JetBrainsMono Nerd Font",
            foreground = colors[5],
        ),
        widget.Battery(
                #fontsize=14,
            font="JetBrainsMono Nerd Font",
            low_percentage=0.25,
            foreground=foregroundColor,
            background=backgroundColor,
            charge_char='',
            full_char='',
            unknown_char='',
            discharge_char='',
            update_interval=1,
            format='{percent:2.0%}{char}',
        ),
        widget.Sep(
            linewidth = 0,
            padding = 10
        ),
        widget.TextBox(
            text = " ",
            fontsize = 16,
            font = "JetBrainsMono Nerd Font",
            foreground = colors[10],
        ),
        widget.Clock(
            format='%I:%M %p',
            font = "JetBrainsMono Nerd Font",
            padding = 10,
            foreground = foregroundColor
        ),
        widget.Systray(
            background = backgroundColor,
            icon_size = 20,
            padding = 4,
        ),
        widget.Sep(
            linewidth = 0,
            padding = 8,
        ),
        widget.Sep(
            linewidth = 1,
            padding = 10,
            foreground = colors[5],
            background = backgroundColor
        ),
        widget.CurrentLayoutIcon(
            scale = 0.5,
            foreground = foregroundColor,
            background = backgroundColor
        ),
        widget.Wallpaper(
            directory="/home/david/Imágenes/wallpapers",
            label=""),
    ]

    return widgets_list

def init_secondary_widgets_list(monitor_num):
    secondary_widgets_list = init_widgets_list(monitor_num)
    del secondary_widgets_list[16:17]
    return secondary_widgets_list

widgets_list = init_widgets_list("1")
secondary_widgets_list = init_secondary_widgets_list("2")
secondary_widgets_list_2 = init_secondary_widgets_list("3")

# Define 3 monitors
screens = [
    Screen(
        top=bar.Bar(
            widgets=widgets_list,
            size=36,
            background=backgroundColor,
            margin=6, 
            opacity=0.8
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets=secondary_widgets_list,
            size=36,
            background=backgroundColor,
            margin=6, 
            opacity=0.8
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets=secondary_widgets_list_2,
            size=36,
            background=backgroundColor,
            margin=6, 
            opacity=0.8
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

#Currently running Qtile in XFCE, so autostart script isn't necessary.  Uncomment if needed.
#Startup applications
#@hook.subscribe.startup_once
#def autostart():
#   home = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
#   subprocess.run([home])

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='Mailspring'), # Mail client
], fullscreen_border_width = 0, border_width = 0)
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
wmname = "Qtile 0.21.0"

