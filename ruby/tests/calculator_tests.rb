require 'rubygems'
require 'active_support/all'
require 'test/unit'
require File.join(File.dirname(__FILE__), '..', 'calculator')

class TestCalculator < Test::Unit::TestCase
 
	def test_simple
		assert_not_nil CALC
	end

	def test_calculate_simple_phrase
		assert_equal CALC.process("1+1"), "2"
	end

	def test_time_calculation
		assert_equal CALC.process("1.day.ago"), 1.day.ago.to_s
	end
 
end