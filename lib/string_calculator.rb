# frozen_string_literal: true

# StringCalculator is a simple calculator that takes a string of numbers as input
# and returns their sum. It handles the following cases:
# - Empty string returns 0
# - Single number returns the number itself
# - Comma-separated numbers returns their sum
#
# @example
#   calculator = StringCalculator.new
#   calculator.add('')      # => 0
#   calculator.add('5')     # => 5
#   calculator.add('1,2,3') # => 6
class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = input.split(/,|\n/).map(&:to_i)
    numbers.sum
  end
end
