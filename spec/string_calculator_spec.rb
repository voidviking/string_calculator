# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  it 'returns 0 for an empty string' do
    expect(StringCalculator.new.call('')).to eq(0)
  end

  it 'returns the number when a single number is passed' do
    expect(StringCalculator.new.call('5')).to eq(5)
  end

  it 'returns the sum of two comma-separated numbers' do
    expect(StringCalculator.new.call('1,2')).to eq(3)
  end

  it 'returns the sum of multiple comma-separated numbers' do
    expect(StringCalculator.new.call('1,2,3,4')).to eq(10)
  end

  it 'handles newlines as delimiters' do
    expect(StringCalculator.new.call("1\n2,3")).to eq(6)
  end

  it 'raises error for negative numbers' do
    expect { StringCalculator.new.call('1,-2,3,-4') }
      .to raise_error('negatives not allowed: -2, -4')
  end

  it 'supports custom delimiter' do
    expect(StringCalculator.new.call("//;\n1;2")).to eq(3)
  end

  it 'custom delimiter can also have multiplication done for args' do
    expect(StringCalculator.new.call("//*\n1*2")).to eq(2)
  end
end
