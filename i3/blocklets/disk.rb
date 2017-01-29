#!/usr/bin/env ruby
# Creates a JSON object compatible to i3bar input protocol to use with i3blocks
# containing total size, used size and percentage of given HDD.
# HDD name must be grepable in df, so it is sufficient to provide the device
# name, such as "sdb1" or the mount name such as "home", as long as they are
# unique. If no HDD is provided, it's assumed that "root" is to be used because
# /dev/root should always show up on df
#
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
# Inspired by: https://github.com/vivien/i3blocks/blob/master/scripts/disk
#
# Copyright (c) 2017, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles

require 'json'
require_relative 'blocklet_helper'



#------------------------------------------------------------------------------
# Getting the informatio
#
json = {}
threshold = { high: 95, medium: 90, low: 85 }

hdd = ARGV[0] || "/dev/root"
df = `df -h`.lines.grep(/#{Regexp.new(hdd)}/)[0].split

total = df[1].to_f
free = df[3].to_f
percentage = df[4].to_f



#------------------------------------------------------------------------------
# Building the JSON object
#
color = BlockletHelper.getColor(percentage, threshold)
json[:full_text] = "#{free}G[#{total}G] (#{percentage}%)"
json[:short_text] = "#{free}G"
json[:color] = color unless color.nil?
json[:min_width] = " #{total}G[#{total}G] (99.99%)"

puts JSON.generate(json)

