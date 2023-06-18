#!/usr/bin/env ruby
#
# Creates a JSON object compatible to i3bar input protocol to use with i3blocks
# containing total RAM available, RAM used and percentage of used RAM; changes
# output color to orange/red when usage is high/very high.
#
# Dependent on nvidia-smi
#
# See: http://developer.download.nvidia.com/compute/DCGM/docs/nvidia-smi-367.38.pdf
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
# Inspired by: https://github.com/vivien/i3blocks/blob/master/scripts/memory_percentage
#
# Copyright (c) 2021, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the BSD 3-Clause License
# Latest version: https://github.com/pygospa/dotfiles

require 'json'
require_relative 'blocklet_helper'

blocklet = {}
threshold = { high: 90, medium: 80, low: 70 }


#------------------------------------------------------------------------------
# Getting & processing the informatio
#
gpu_freq = `nvidia-smi --query-gpu=clocks.sm --format=csv,noheader`.split[0].to_f / 1024
gpu_usage = `nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader`.split[0].to_f
gpu_mem = `nvidia-smi --query-gpu=memory.total --format=csv,noheader`.split[0].to_f / 1024
gpu_mem_used = `nvidia-smi --query-gpu=memory.used --format=csv,noheader`.split[0].to_f / 1024
gpu_mem_perc =  (gpu_mem_used / gpu_mem) * 100


#------------------------------------------------------------------------------
# Building the JSON object
#
color = BlockletHelper.getColor(gpu_usage, threshold)
blocklet[:full_text] = " #{gpu_usage}% of #{gpu_freq.round(1)}GHz, \
 #{gpu_mem_used.round(1)}/#{gpu_mem.round(1)}GB (#{gpu_mem_perc.round(1)}%)"
blocklet[:short_text] = " #{gpu_usage}% "
blocklet[:color] = color unless color.nil?
blocklet[:min_width] = " 99.9% of 1.3GHz,  3.9/3.9GB (99.9%)"

puts JSON.generate(blocklet)
