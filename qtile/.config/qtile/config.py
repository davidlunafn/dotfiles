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
    "xset dpms 0 0 0",
    "xset -dpms",
    "xrandr --output eDP-1 --mode 1920x1080 --scale 1x1",
    "picom &",
    "nm-applet &",
    "blueman-applet &",
    "pgadmin4 &"
]


for x in autostart:
    os.system(x)

idle_activation_enabled = False
idle_activation_delay = 0


def logout_session(qtile):
    qtile.shutdown()


keys = [
    ######### KEY BILDINGS FOR IPAD SESSION #####################
    Key(['mod1'], "space", lazy.spawn(
        "bash /home/david/.config/rofi/launchers/type-3/launcher.sh"), desc="Launch rofi"),
    Key(['mod1'], "q", lazy.window.kill(), desc="Kill focused window"),


    ######### KEY BILDINGS FOR DESKTOP SESSION #####################
    Key([mod, 'mod1'], 'x', lazy.function(logout_session), desc='Logout'),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "m", lazy.layout.next(),
        desc="Move window focus to other window"),

    Key([mod], "space", lazy.spawn(
        "bash /home/david/.config/rofi/launchers/type-3/launcher.sh"), desc="Launch rofi"),
    Key([mod], "o", lazy.hide_show_bar("top"), desc="hide bar"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
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
    Key([mod, "shift"], "x", lazy.spawn(
        "bash /home/david/.config/rofi/scripts/powermenu_t2"), desc="Powermenu"),
    Key([mod, "shift"], "l", lazy.spawn(
        "betterlockscreen -l blur"), desc="Lock Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Control de Volumen
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "bash /home/david/.config/qtile/scripts/volume.sh down"), desc="Bajar Volumen"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "bash /home/david/.config/qtile/scripts/volume.sh up"), desc="Subir Volumen"),
    Key([], "XF86AudioMute", lazy.spawn(
        "bash /home/david/.config/qtile/scripts/volume.sh mute"), desc="Mute Volumen"),

    # Control de brillo
    Key([], "XF86MonBrightnessUp", lazy.spawn(
        "bash /home/david/.config/qtile/scripts/brightness-control.sh up"), desc="Subir Brillo"),
    Key([], "XF86MonBrightnessDown", lazy.spawn(
        "bash /home/david/.config/qtile/scripts/brightness-control.sh down"), desc="Bajar Brillo"),

    Key([mod], "XF86MonBrightnessUp", lazy.spawn(
        "redshift -O 6500K -r -P"), desc="modo dia"),
    Key([mod], "XF86MonBrightnessDown", lazy.spawn(
        "redshift -O 4500K -r -P"), desc="modo nocturno"),

    # Captura de pantalla
    Key([], "print", lazy.spawn("scrot -s --freeze -o '/home/david/Imágenes/Capturas/%Y-%m-%d_%H:%M:%S.png' -l opacity=10 -q 100 -e 'xclip -selection clipboard -t image/png -i $f'"), desc="Captura de pantalla selección"),
    Key([mod], "Print", lazy.spawn("scrot -o '/home/david/Imágenes/Capturas/%Y-%m-%d_%H:%M:%S.png' -l opacity=10 -q 100 -e 'xclip -selection clipboard -t image/png -i $f'"),
        desc="Captura de pantalla completa"),

    # Run emacs
    Key([mod], "e", lazy.spawn("code"), desc="run vscode"),
    # Control de monitores
    Key([mod], "p", lazy.spawn("python2 /home/david/.config/qtile/scripts/monitors.py"),
        desc="Configurar segundo monitor"),
]

# Create labels for groups and assign them a default layout.
groups = []

group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

# group_labels = ["", "", "", "", "", "", "", "", "ﭮ", ""]
group_labels = ["", "", "", "", "", "", "", "", "", ""]

group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall",
                 "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

# Add group names, labels, and default layouts to the groups object.
for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))


# @hook.subscribe.setgroup
# def changegroup():
#    for g in range(len(group_names)):
#        if qtile.groups[g].windows:
#            qtile.groups[g].label = "󰊠"
#        else:
#            qtile.groups[g].label = ""
#    qtile.current_group.label = "󰮯"


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
    DropDown("term", "kitty --class=scratch", width=0.8,
             height=0.8, x=0.1, y=0.1, opacity=1),
    DropDown("ranger", "kitty --class=ranger -e ranger",
             width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    DropDown("volume", "kitty --class=volume -e pulsemixer",
             width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
]))

# Scratchpad keybindings
keys.extend([
    Key([mod], "t", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod], "f", lazy.group['scratchpad'].dropdown_toggle('ranger')),
    Key([mod], "v", lazy.group['scratchpad'].dropdown_toggle('volume')),
])

colors, backgroundColor, foregroundColor, workspaceColor, chordColor = colors.custom()

# Define layouts and layout themes
layout_theme = {
    "margin": 8,
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
    fontsize=16,
    padding=2,
    background=backgroundColor
)


def init_widgets_list(monitor_num):
    widgets_list = [
        widget.TextBox(
            text="",
            fontsize=45,
            font="JetBrainsMono Nerd Font",
            foreground=colors[7],
            padding=20,
            background=backgroundColor
        ),
        widget.Spacer(
            length=bar.STRETCH
        ),

        widget.GroupBox(
            font="JetBrainsMono Nerd Font",
            fontsize=22,
            padding_x=6,
            margin_x=6,
            active="#66afbb",
            inactive='#4a4e5c',
            center_aligned=True,
            highlight_method="text",
            this_screen_border="#4a4e5c",
            this_current_screen_border=colors[7],
            other_screen_border="#4a4e5c",
            other_current_screen_border="#4a4e5c",
            foreground=foregroundColor,
            background=backgroundColor,
        ),

        widget.CurrentLayoutIcon(
            scale=0.5,
            foreground=colors[4],
            background=backgroundColor,
            padding=10,
        ),
        widget.Spacer(
            length=100
        ),
        widget.Spacer(
            length=bar.STRETCH
        ),

        widget.CPU(
            font="JetBrainsMono Nerd Font",
            update_interval=1.0,
            format='    \n{load_percent:.0f}% ',
            max_chars=9,
            foreground=colors[4],
            padding=2,
            fontsize=16
        ),
        widget.Memory(
            font="JetBrainsMono Nerd Font",
            foreground=colors[4],
            format='   \n{MemUsed: .0f}{mm}/{MemTotal:.0f}{mm}',
            measure_mem='G',
            padding=2,
            fontsize=16,
        ),

        widget.Battery(
            font="JetBrainsMono Nerd Font",
            low_percentage=0.25,
            foreground=colors[4],
            background=backgroundColor,
            charge_char='',
            full_char='',
            unknown_char='',
            discharge_char='',
            update_interval=1,
            format='  󰂏 \n{percent: 2.0%}{char}',
            fontsize=16
        ),
        widget.Clock(
            format='  \n%I:%M',
            font="JetBrainsMono Nerd Font",
            fontsize=16,
            padding=10,
            foreground=colors[4],
            background=backgroundColor
        ),
        widget.Systray(
            background=backgroundColor,
            icon_size=22,
            padding=5,
        ),
        widget.Sep(
            linewidth=0,
            padding=10,
            foreground="#FFFFFF",
            background=backgroundColor
        ),
        widget.QuickExit(
            default_text='󰤆 ',
            countdown_format='{}',
            font="JetBrainsMono Nerd Font",
            fontsize=30,
            padding=20,
            background=backgroundColor,
            foreground=colors[7]
        ),
        widget.Sep(
            linewidth=0,
            padding=10,
        ),
    ]

    return widgets_list


def init_secondary_widgets_list(monitor_num):
    secondary_widgets_list = init_widgets_list(monitor_num)
    del secondary_widgets_list[21:22]
    return secondary_widgets_list


widgets_list = init_widgets_list("1")
secondary_widgets_list = init_secondary_widgets_list("2")
secondary_widgets_list_2 = init_secondary_widgets_list("3")

# Define 3 monitors
screens = [
    Screen(
        wallpaper='/home/david/.config/qtile/wallpapers/bg3.jpg',
        wallpaper_mode='fill',
        top=bar.Bar(
            widgets=widgets_list,
            size=60,
            background=backgroundColor,
            margin=5,
            opacity=1.0
        ),
    ),
    Screen(
        wallpaper='/home/david/.config/qtile/wallpapers/bg3.jpg',
        wallpaper_mode='fill',
        top=bar.Bar(
            widgets=secondary_widgets_list,
            size=50,
            background='#0b141a',
            margin=10,
            opacity=0.8
        ),
    ),
    Screen(
        wallpaper='/home/david/.config/qtile/wallpapers/bg3.jpg',
        wallpaper_mode='fill',
        top=bar.Bar(
            widgets=secondary_widgets_list_2,
            size=50,
            background='#0b141a',
            margin=10,
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

# Currently running Qtile in XFCE, so autostart script isn't necessary.  Uncomment if needed.
# Startup applications
# @hook.subscribe.startup_once
# def autostart():
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
    Match(wm_class='Mailspring'),  # Mail client
], fullscreen_border_width=0, border_width=0)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


wmname = "Qtile 0.22.2"
