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
class StringCalculatorSevice
  attr_reader( *%i[input delimiter numbers] )

  def initialize(input)
    @input = input
  end

  def call
    return 0 if @input.empty?

    if @input.start_with?('//')
      @delimiter, @input = @input.split("\n", 2)
      @delimiter = @delimiter[2]
      @numbers = @input.split(/#{Regexp.escape(@delimiter)}/)
    else
      @numbers = @input.split(/,|\n/)
    end
    @numbers = @numbers.map(&:to_i)
    negatives = numbers.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    process
  end

  private

  def process
    if delimiter.eql?('*')
      times
    else
      if delimiter.eql?('o')
        @numbers = get_odd_numbers
      end

      sum
    end
  end

  def sum
    numbers.sum
  end

  def times
    numbers.reduce(1) do |actual_value, number|
      actual_value * number
    end
  end

  def get_odd_numbers
    [0] unless numbers.any?

    @numbers.select { |number| number.odd?  }
  end
end
