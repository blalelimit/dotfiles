#!/bin/bash

# Increase brightness +5%
brightnessctl set +5%

brightness="$(brightnessctl i | grep Current | awk '{print $4}' | tr -d '(' | tr -d ')')"
