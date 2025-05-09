# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  it 'returns 0 for an empty string' do
    expect(StringCalculator.new.add('')).to eq(0)
  end

  it 'returns the number when a single number is passed' do
    expect(StringCalculator.new.add('5')).to eq(5)
  end
end
