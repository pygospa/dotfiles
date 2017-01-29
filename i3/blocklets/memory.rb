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



#------------------------------------------------------------------------------
# Getting the informatio
#
json = {}
work = 70
warn = 80
crit = 90

memfree = `cat /proc/meminfo | grep 'MemFree' | awk '{print $2}'`.chomp.to_f
buffers = `cat /proc/meminfo | grep 'Buffers' | awk '{print $2}'`.chomp.to_f
cached = `cat /proc/meminfo | grep 'Cached' | awk '{print $2}'`.chomp.to_f

memory_total = (`cat /proc/meminfo | grep 'MemTotal' | awk '{print $2}'`.chomp.to_f / 1024 / 1024).round(1)
memory_used = (memory_total - (memfree + buffers + cached) / 1024 / 1024).round(1)
memory_percentage = (memory_used / memory_total * 100).round(1)



#------------------------------------------------------------------------------
# Coloring
#
if memory_percentage > crit
  color = "#dc322f"
elsif memory_percentage > warn
  color = "#cb4b16"
elsif memory_percentage > work
  color = "#b58900"
else
  color = nil
end



#------------------------------------------------------------------------------
# Building the JSON object
#
json["full_text"] = "#{memory_used.round(2)}G/#{memory_total.round(2)}G (#{memory_percentage.round(2)}%)"
json["short_text"] = "#{memory_percentage.round(2)}%"
json["color"] = color unless color.nil?
json["min_width"] = " #{memory_total.round(2)}G/#{memory_total.round(2)}G (99.99%)"

puts JSON.generate(json)

