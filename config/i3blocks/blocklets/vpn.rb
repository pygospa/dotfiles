#!/usr/bin/env ruby
#
# Creates a JSON object compatible to i3bar input protocol to use with i3blocks
# containing the word VPN in green when there is an active VPN connection, or
# in red, when it is offline.
#
# Copyright (c) 2017-2021, Kannan Thambiah
# Licensed under the BSD 3-Clause License
# Latest version: https://github.com/pygospa/dotfiles

require 'json'

blocklet = {}


#------------------------------------------------------------------------------
# Getting & processing the informatio
#
#tunnel = `ip link show`.include?("tun")
tunnel = not(`nmcli connection | grep -i neuland`.include?("--"))

#------------------------------------------------------------------------------
# Building the JSON object
#
color = tunnel ? "#50fa7b" : "#ff5555"
blocklet[:full_text] = tunnel ? "neuland" : ""
blocklet[:short_text] = tunnel ? "neuland" : ""
blocklet[:color] = color unless color.nil?
blocklet[:min_width] = " neuland "

puts JSON.generate(blocklet)
