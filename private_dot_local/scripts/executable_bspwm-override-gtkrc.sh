#!/bin/bash

# Override gtk settings (particularly mouse cursor)
cp -f ~/.config/bspwm/configs/gtkrc-2.0 ~/.gtkrc-2.0
cp -f ~/.config/bspwm/configs/gtkrc-3.0 ~/.config/gtk-3.0/settings.ini
cp -f ~/.config/bspwm/configs/gtkrc-4.0 ~/.config/gtk-4.0/settings.ini
