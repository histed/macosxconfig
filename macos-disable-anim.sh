#!/bin/sh
# 250203 MH, from:
#https://www.reddit.com/r/MacOS/comments/pqbrrg/how_to_speed_up_animations_in_macos/?rdt=55644

defaults write com.apple.finder DisableAllAnimations -bool true
#disables all Finder animations. Relaunch Finder afterwards via Command-Option-Escape.
defaults write com.apple.dock springboard-show-duration -float .1
defaults write com.apple.dock springboard-hide-duration -float .1
#speeds up the Launchpad show/hide animation (you can modify the float values to your liking, a value of 0 disables the animation).
defaults write com.apple.dock springboard-page-duration -float .2
#speeds up the Launchpad "page-flip" animation.
#Again, you can modify the float value to your liking, 0 disables the animation. For this, you have to relaunch the Dock afterwards via Terminal: killall dock.

#You can reverse all modifications by replacing the defaults write command with defaults delete and omitting the value after the key. E.g.

#defaults delete com.apple.finder DisableAllAnimations
