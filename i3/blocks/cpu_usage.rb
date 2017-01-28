#!/usr/bin/env ruby
#
# Creates a JSON object compatible to i3bar input protocol to use with i3blocks
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
# Inspired by: https://github.com/vivien/i3blocks/blob/master/scripts/cpu_usage
#
# Copyright (c) 2017, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles

require 'json'

json = {}
t_work = 70;
t_warn = 80;
t_crit = 90;

cpu_usage = 100.00 - `mpstat 1 1 2>&1 | awk '{print $NF}' | tail -1`.chomp().to_f()

if cpu_usage > t_crit
  color = "#dc322f"
elsif cpu_usage > t_warn
  color = "#cb4b16"
elsif cpu_usage > t_work
  color = "#b58900"
else
  color = nil
end

json["full_text"] = "#{cpu_usage.round(2)}%"
json["color"] = color unless color.nil?
json["min_width"] = "100.00%"

puts JSON.generate(json)
