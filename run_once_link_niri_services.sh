#!/bin/sh
systemctl --user add-wants niri.service mako.service
systemctl --user add-wants niri.service swayidle.service
systemctl --user add-wants niri.service waybar.service
