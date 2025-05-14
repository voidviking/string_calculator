# frozen_string_literal: true

# StringCalculator is a class that provides functionality to add numbers from a string input.
# It supports the following features:
# - Empty string returns 0
# - Numbers can be delimited by commas or newlines
# - Custom delimiter can be specified using //delimiter\n format
# - Negative numbers are not allowed and will raise an exception
# - Numbers are summed together
#
# @example Basic usage
#   calculator = StringCalculator.new
#   calculator.add("1,2,3")    # => 6
#   calculator.add("1\n2,3")   # => 6
#   calculator.add("//;\n1;2") # => 3
#
# @example Error cases
#   calculator.add("1,-2,3")   # => raises "negatives not allowed: -2"
#   calculator.add("")         # => 0
class StringCalculator
  def add(input)
    return 0 if input.empty?

    if input.start_with?('//')
      delimiter, input = input.split("\n", 2)
      delimiter = delimiter[2]
      numbers = input.split(/#{Regexp.escape(delimiter)}/)
    else
      numbers = input.split(/,|\n/)
    end

    integers = numbers.map(&:to_i)
    negatives = integers.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    if delimiter.eql?('*')
      integers.reduce(1) do |actual_value, number|
        actual_value * number
      end
    else
      integers.sum
    end
  end
end
