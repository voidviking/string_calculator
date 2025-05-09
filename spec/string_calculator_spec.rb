# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  it 'returns 0 for an empty string' do
    expect(StringCalculator.new.add('')).to eq(0)
  end

  it 'returns the number when a single number is passed' do
    expect(StringCalculator.new.add('5')).to eq(5)
  end

  it 'returns the sum of two comma-separated numbers' do
    expect(StringCalculator.new.add('1,2')).to eq(3)
  end

  it 'returns the sum of multiple comma-separated numbers' do
    expect(StringCalculator.new.add('1,2,3,4')).to eq(10)
  end
end
