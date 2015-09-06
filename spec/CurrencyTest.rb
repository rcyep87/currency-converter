require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative '../lib/CurrencyClass.rb'  # => true

class CurrencyClassTest < Minitest::Test

  def test_currency_exists
    assert(Currency)        # => true
  end

  def test_plus_method
    currency       = Currency.new(50, "USD")   # => #<Currency:0x007f8ccc0f4f28 @amt_to_convert=50, @ccode="USD">
    currency2      = Currency.new(100, "USD")  # => #<Currency:0x007f8ccc0f4b90 @amt_to_convert=100, @ccode="USD">
    expected       = Currency.new(150, "USD")  # => #<Currency:0x007f8ccc0f4870 @amt_to_convert=150, @ccode="USD">
    actual         = currency + currency2      # => #<Currency:0x007f8ccc0f4550 @amt_to_convert=150, @ccode="USD">
    assert_equal(expected, actual)             # => true
  end

  def test_equal_method
    currency       = Currency.new(100, "USD")                              # => #<Currency:0x007f8ccc0ff130 @amt_to_convert=100, @ccode="USD">
    currency2      = Currency.new(100, "USD")                              # => #<Currency:0x007f8ccc0fed70 @amt_to_convert=100, @ccode="USD">
    expected       = Currency.new(100, "USD") == Currency.new(100, "USD")  # => true
    actual         = currency == currency2                                 # => true
    assert_equal(expected, actual)                                         # => true
  end

  def test_custom_error
    assert(DifferentCurrencyCodeError)  # => true
  end

  def test_not_equal_method
    currency       = Currency.new(100, "USD")                             # => #<Currency:0x007f8ccc0f5f68 @amt_to_convert=100, @ccode="USD">
    currency2      = Currency.new(50, "GPD")                              # => #<Currency:0x007f8ccc0f5cc0 @amt_to_convert=50, @ccode="GPD">
    expected       = Currency.new(100, "USD") != Currency.new(50, "GPD")  # => true
    actual         = currency != currency2                                # => true
    assert_equal(expected, actual)                                        # => true
  end

  def test_minus_method
    currency       = Currency.new(75, "USD")  # => #<Currency:0x007f8ccc0f5bd0 @amt_to_convert=75, @ccode="USD">
    currency2      = Currency.new(50, "USD")  # => #<Currency:0x007f8ccc0effa0 @amt_to_convert=50, @ccode="USD">
    expected       = Currency.new(25, "USD")  # => #<Currency:0x007f8ccc0efd98 @amt_to_convert=25, @ccode="USD">
    actual         = currency - currency2     # => #<Currency:0x007f8ccc0efb40 @amt_to_convert=25, @ccode="USD">
    assert_equal(expected, actual)            # => true

    currency       = Currency.new(25, "USD")   # => #<Currency:0x007f8ccc0ef4d8 @amt_to_convert=25, @ccode="USD">
    currency2      = Currency.new(50, "USD")   # => #<Currency:0x007f8ccc0ef190 @amt_to_convert=50, @ccode="USD">
    expected       = Currency.new(-25, "USD")  # => #<Currency:0x007f8ccc0eeee8 @amt_to_convert=-25, @ccode="USD">
    actual         = currency - currency2      # => #<Currency:0x007f8ccc0eece0 @amt_to_convert=-25, @ccode="USD">
    assert_equal(expected, actual)             # => true
  end

  def test_plus_with_error
    currency       = Currency.new(75, "USD")      # => #<Currency:0x007f8ccc0f6da0 @amt_to_convert=75, @ccode="USD">
    currency2      = Currency.new(25, "GPD")      # => #<Currency:0x007f8ccc0f6a80 @amt_to_convert=25, @ccode="GPD">
    assert_raises(DifferentCurrencyCodeError) do
      total_amt = currency + currency2
    end                                           # => #<DifferentCurrencyCodeError: DifferentCurrencyCodeError>
  end

  def test_minus_with_error
    currency       = Currency.new(100, "USD")     # => #<Currency:0x007f8ccc0fdd58 @amt_to_convert=100, @ccode="USD">
    currency2      = Currency.new(25, "GPD")      # => #<Currency:0x007f8ccc0fdb50 @amt_to_convert=25, @ccode="GPD">
    assert_raises(DifferentCurrencyCodeError) do
      total_amt = currency - currency2
    end                                           # => #<DifferentCurrencyCodeError: DifferentCurrencyCodeError>
  end

  def test_multiply_method
    currency       = Currency.new(10, "USD")  # => #<Currency:0x007f8ccc0fd2e0 @amt_to_convert=10, @ccode="USD">
    multiple       = 3                        # => 3
    expected       = Currency.new(30, "USD")  # => #<Currency:0x007f8ccc0fcf98 @amt_to_convert=30, @ccode="USD">
    actual         = currency * multiple      # => nil
    assert_equal(expected, actual)
  end
end
