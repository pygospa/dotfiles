#!/usr/bin/env ruby
#
# Creates a JSON object compatible to i3bar input protocol to use with i3blocks
# containing number of cores, sum of current workload and workload per core (as
# cli graph using braile letter), and range of current individual core
# frequencies (min-max)
# changes output color to orange and red when under high/very high load.
#
# Dependent on /proc filesystem and mpstat
#
# See: https://linux.die.net/man/5/proc
# See: https://www.thegeekdiary.com/proccpuinfo-file-explained/
# See: https://linux.die.net/man/1/mpstat
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
# Inspired by: https://github.com/vivien/i3blocks/blob/master/scripts/cpu_usage
#
# Copyright (c) 2017-2021, Kannan Thambiah
# Licensed under the BSD 3-Clause License
# Latest version: https://github.com/pygospa/dotfiles

require 'json'
require_relative 'blocklet_helper'

blocklet = {}
threshold = { high: 90, medium: 80, low: 70 }


#------------------------------------------------------------------------------
# Getting & processing the informatio
#
cpuinfo = `cat /proc/cpuinfo`.lines
mpstat = `mpstat -P ALL 1 1 2>&1`.lines[1..]

cpu_total = 100 - mpstat[2].split[-1].to_f
no_of_cores = mpstat[((mpstat.size / 2) + 3)..].size

core_stats = mpstat[((mpstat.size / 2) + 3)..].map do |line|
  "#{BlockletHelper.getBarFor((100 - line.split[-1].to_f).round(0))}"
end.join("|")

max_freq = 0
cpuinfo.grep(/MHz/).each do |freq_line|
  freq = (freq_line.split[-1].to_f) / 1024
  max_freq = freq if freq > max_freq
end

cpu_freq = cpuinfo.grep(/MHz/).map { |line| line.split[-1].to_f / 1024 }.minmax


#------------------------------------------------------------------------------
# Building the JSON object
#
color = BlockletHelper.getColor(cpu_total, threshold)
blocklet[:full_text] = " #{cpu_total.round(2)}% of #{no_of_cores}x \
#{cpu_freq[0].round(1)}-#{cpu_freq[1].round(1)}GHz [#{core_stats}]"
blocklet[:short_text] = "#{cpu_total.round(2)}%"
blocklet[:color] = color unless color.nil?
blocklet[:min_width] = "  99.99% of #{no_of_cores}x \
0.8-3.4GHz [#{"⢀|" * 7}⢀]"

puts JSON.generate(blocklet)
