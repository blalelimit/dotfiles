#!/bin/bash

# Get brightness
brightnessctl i | grep Current | awk '{print $4}' | tr -d '(' | tr -d ')'
