#!/usr/bin/env python3

import re
import subprocess

# Define the options to be displayed in Rofi
options = ['Duplicate', 'Extend to the right',
           'Extend to the left', 'Primary only', 'Secondary only']

# Get the names of the connected monitors
xrandr_process = subprocess.Popen(
    ['xrandr'], stdout=subprocess.PIPE, encoding='utf-8')
xrandr_output, _ = xrandr_process.communicate()

connected_monitors = re.findall(r'(\w+-\d+) connected', xrandr_output)

if len(connected_monitors) < 2:
    print('Error: Only one monitor is connected.')
    exit(1)

# Create a string with the options separated by newlines
options_string = '\n'.join(options)

# Call Rofi and display the options as a menu
rofi_process = subprocess.Popen(['rofi', '-dmenu', '-p', 'Select an option:', '-lines', '5'],
                                stdin=subprocess.PIPE, stdout=subprocess.PIPE, encoding='utf-8')
rofi_output, _ = rofi_process.communicate(input=options_string)

# Remove the trailing newline from the selected option
selected_option = rofi_output.strip()

# Set the xrandr command based on the selected option
if selected_option == 'Duplicate':
    # Get the resolution of the secondary monitor
    xrandr_process = subprocess.Popen(
        ['xrandr', '-q', '--verbose'], stdout=subprocess.PIPE, encoding='utf-8')
    xrandr_output, _ = xrandr_process.communicate()

    secondary_resolution = re.findall(
        r'HDMI-1 connected.*?(\d+x\d+).*?\n', xrandr_output)[0]

    # Set the command to duplicate the primary monitor onto the secondary monitor
    command = f'xrandr --output {connected_monitors[1]} --mode {secondary_resolution} --scale 1.25x1.25 --same-as {connected_monitors[0]}'
elif selected_option == 'Extend to the right':
    # Set the command to extend the primary monitor to the right of the secondary monitor
    command = f'xrandr --output {connected_monitors[0]} --auto --scale 1x1 --output {connected_monitors[1]} --auto --right-of {connected_monitors[0]}'
elif selected_option == 'Extend to the left':
    # Set the command to extend the primary monitor to the left of the secondary monitor
    command = f'xrandr --output {connected_monitors[0]} --auto --scale 1x1 --output {connected_monitors[1]} --auto --left-of {connected_monitors[0]}'
elif selected_option == 'Primary only':
    # Set the command to use only the primary monitor
    command = f'xrandr --output {connected_monitors[0]} --auto --scale 1x1 --output {connected_monitors[1]} --off'
elif selected_option == 'Secondary only':
    # Set the command to use only the secondary monitor
    command = f'xrandr --output {connected_monitors[1]} --auto --output {connected_monitors[0]} --off'
else:
    print('Invalid option selected')
    exit(1)

# Call xrandr with the selected command
xrandr_process = subprocess.Popen(
    command.split(), stdout=subprocess.PIPE, encoding='utf-8')
xrandr_output, _ = xrandr_process.communicate()

# Print the xrandr output for debugging purposes
print(xrandr_output)
