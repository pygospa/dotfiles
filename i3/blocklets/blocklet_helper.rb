# Helper functions needed in every blocklet are sourced out into this module to
# have DRY code.
# Blocklets are scripts that create JSON objects compatible to i3bar input
# protocol to use with i3blocks in a i3wm environment
#
# See: http://i3wm.org/docs/i3bar-protocol.html
# See: https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
#
# Copyright (c) 2017, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


module BlockletHelper

  #----------------------------------------------------------------------------
  # Define red, orange and yellow according to the Solarized color scheme
  # See: http://ethanschoonover.com/solarized
  #
  YELLOW = "#b58900"
  ORANGE = "#cb4b16"
  RED = "#dc322f"



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

  module_function :getColor
end
