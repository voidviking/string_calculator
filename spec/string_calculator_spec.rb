# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculatorSevice do
  it 'returns 0 for an empty string' do
    expect(StringCalculatorSevice.new('').call).to eq(0)
  end

  it 'returns the number when a single number is passed' do
    expect(StringCalculatorSevice.new('5').call).to eq(5)
  end

  it 'returns the sum of two comma-separated numbers' do
    expect(StringCalculatorSevice.new('1,2').call).to eq(3)
  end

  it 'returns the sum of multiple comma-separated numbers' do
    expect(StringCalculatorSevice.new('1,2,3,4').call).to eq(10)
  end

  it 'handles newlines as delimiters' do
    expect(StringCalculatorSevice.new("1\n2,3").call).to eq(6)
  end

  it 'raises error for negative numbers' do
    expect { StringCalculatorSevice.new('1,-2,3,-4').call }
      .to raise_error('negatives not allowed: -2, -4')
  end

  it 'supports custom delimiter' do
    expect(StringCalculatorSevice.new("//;\n1;2").call).to eq(3)
  end

  it 'custom delimiter can also have multiplication done for args' do
    expect(StringCalculatorSevice.new("//*\n1*2").call).to eq(2)
  end

  # Test for new reqs"
  it 'Sums up all the odd numbers if custom del is o' do
    expect(StringCalculatorSevice.new("//o\n1o2").call).to eq(1)
  end
end
