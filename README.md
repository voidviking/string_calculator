# String Calculator

A Ruby implementation of the String Calculator kata, which provides functionality to add numbers from a string input with various delimiter formats.

## Features

- Handles empty strings (returns 0)
- Supports comma-separated numbers
- Supports newline-delimited numbers
- Supports custom delimiters
- Validates and rejects negative numbers
- Sums all valid numbers in the input

## Requirements

- Ruby 3.3.5p100
- Bundler 2.6.8

## Dependencies

- rspec (~> 3.13) - Testing framework
- rubocop (~> 1.75) - Code style enforcement

## Installation

1. Clone the repository:
```bash
git clone git@github.com:voidviking/string_calculator.git
cd string_calculator
```

2. Install dependencies:
```bash
bundle install
```

## Usage

```ruby
calculator = StringCalculator.new

# Basic usage
calculator.add("")         # => 0
calculator.add("1,2,3")    # => 6
calculator.add("1\n2,3")   # => 6

# Custom delimiter
calculator.add("//;\n1;2") # => 3

# Error cases
calculator.add("1,-2,3")   # => raises "negatives not allowed: -2"
```

## Development

### Running Tests

The project uses RSpec for testing. To run the test suite:

```bash
bundle exec rspec
```

### Code Style

The project uses RuboCop for code style enforcement. To check the code style:

```bash
bundle exec rubocop
```

## License

This project is open source and available under the MIT License. 