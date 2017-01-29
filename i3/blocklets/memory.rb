#!/usr/bin/env ruby
# Creates a JSON object compatible to i3bar input protocol to use with i3blocks
# containing total RAM available, RAM used and percentage of used RAM; changes
# output color to orange/red when usage is high/very high.
#
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
# Inspired by: https://github.com/vivien/i3blocks/blob/master/scripts/memory_percentage
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
threshold = { high: 90, medium: 80, low: 70 }
k2g = 1.0 / 1024 / 1024



#------------------------------------------------------------------------------
# Grab memoriy information from /proc/meminfo
#
meminfo = `cat /proc/meminfo`.lines
memtotal = meminfo.grep(/MemTotal/)[0].split[1].to_f
memfree = meminfo.grep(/MemFree/)[0].split[1].to_f
buffers = meminfo.grep(/Buffers/)[0].split[1].to_f
cached = meminfo.grep(/Cached/)[0].split[1].to_f


#------------------------------------------------------------------------------
# Make them printable
#
memory_total = (memtotal * k2g).round(1)
memory_used = (memory_total - (memfree + buffers + cached) * k2g).round(1)
memory_percentage = (memory_used / memory_total * 100).round(1)



#------------------------------------------------------------------------------
# Building the JSON object
#
color = BlockletHelper.getColor(memory_percentage, threshold)
json[:full_text] = "#{memory_used}G/#{memory_total}G (#{memory_percentage}%)"
json[:short_text] = "#{memory_percentage}%"
json[:color] = color unless color.nil?
json[:min_width] = " #{memory_total}G/#{memory_total}G (99.99%)"

puts JSON.generate(json)

