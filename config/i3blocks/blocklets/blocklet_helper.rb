#!/usr/bin/env ruby
#
# Helper functions needed in every blocklet are sourced out into this module to
# have DRY code.
# Blocklets are scripts that create JSON objects compatible to i3bar input
# protocol to use with i3blocks in a i3wm environment
#
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
#
# Copyright (c) 2017-2021, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the BSD 3-Clause License
# Latest version: https://github.com/pygospa/dotfiles


module BlockletHelper

  #----------------------------------------------------------------------------
  # Define red, orange and yellow according to the Solarized color scheme
  # See: http://ethanschoonover.com/solarized
  #
  YELLOW = "#b58900"
  ORANGE = "#ffb86c"
  RED = "#ff5555"



  #----------------------------------------------------------------------------
  # Return colors for high, medium and low workload
  #
  def getColor(value, threshold)
    if value > threshold[:high]
      color = RED
    elsif value > threshold[:medium]
      color = ORANGE
    elsif value > threshold[:low]
      color = YELLOW
    else
      color = nil
    end

    return color
  end



  #----------------------------------------------------------------------------
  # Return braile letters as bar-chart fillment
  #
  def getBarFor(percentage)
    if percentage < 1
      bar = ' '
    elsif percentage < 10
      bar = '⢀'
    elsif percentage < 25
      bar = '⣀'
    elsif percentage < 40
      bar = '⣠'
    elsif percentage < 50
      bar = '⣤'
    elsif percentage < 60
      bar = '⣴'
    elsif percentage < 75
      bar = '⣶'
    elsif percentage < 90
      bar = '⣾'
    else
      bar = '⣿'
    end
  
    return bar
  end
  
  module_function :getColor
  module_function :getBarFor
end
