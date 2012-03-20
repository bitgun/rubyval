#
#  calculator.rb
#  RubyVal
#
#  Created by Shawn Roske on 3/6/12.
#  Copyright 2012 Bitgun Interactive, LLC. All rights reserved.
#

require 'rubygems'
require 'active_support/all'

class Calculator

    def process( phrase )
        eval(phrase).to_s
    end

end

CALC = Calculator.new
