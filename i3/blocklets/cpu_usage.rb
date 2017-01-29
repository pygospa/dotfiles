#!/usr/bin/env ruby
# Creates a JSON object compatible to i3bar input protocol to use with i3blocks
# containing number of cores, frequency and current workload (as percentage);
# changes output color to orange and red when under high/very high load.
#
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
# Inspired by: https://github.com/vivien/i3blocks/blob/master/scripts/cpu_usage
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

cpu_usage = 100.00 - `mpstat 1 1 2>&1 | awk '{print $NF}' | tail -1`.chomp.to_f
no_of_cpus = `nproc`.to_i
cpu_freq = `cat /proc/cpuinfo | grep 'model name' | tail -1 | awk '{print $NF}'`.chomp



#------------------------------------------------------------------------------
# Coloring
#
if cpu_usage > crit
  color = "#dc322f"
elsif cpu_usage > warn
  color = "#cb4b16"
elsif cpu_usage > work
  color = "#b58900"
else
  color = nil
end



#------------------------------------------------------------------------------
# Building the JSON object
#
json["full_text"] = "#{no_of_cpus}x#{cpu_freq} (#{cpu_usage.round(2)}%)"
json["short_text"] = "#{cpu_usage.round(2)}%"
json["color"] = color unless color.nil?
json["min_width"] = " #{no_of_cpus}x#{cpu_freq} (99.99%)"

puts JSON.generate(json)
