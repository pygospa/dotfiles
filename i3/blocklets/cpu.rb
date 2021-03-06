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
require_relative 'blocklet_helper'


#------------------------------------------------------------------------------
# Getting the informatio
#
blocklet = {}
threshold = { high: 90, medium: 80, low: 70}

cpuinfo = `cat /proc/cpuinfo`.lines
cpu_idle = `mpstat 1 1 2>&1`.split[-1].to_f

cpu_usage = 100 - cpu_idle
no_of_cores = cpuinfo.grep(/processor/).size
cpu_freq = cpuinfo.grep(/model name/).last.split.last


#------------------------------------------------------------------------------
# Building the JSON object
#
color = BlockletHelper.getColor(cpu_usage, threshold)
blocklet[:full_text] = "#{no_of_cores}x#{cpu_freq} (#{cpu_usage.round(2)}%)"
blocklet[:short_text] = "#{cpu_usage.round(2)}%"
blocklet[:color] = color unless color.nil?
blocklet[:min_width] = " #{no_of_cores}x#{cpu_freq} (99.99%)"

puts JSON.generate(blocklet)
