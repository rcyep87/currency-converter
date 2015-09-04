require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/CurrencyClass.rb'

class CurrencyClassTest < Minitest::Test

  def test_currency_exists
    assert(Currency)
  end

  def test_plus_method
    currency       = Currency.new(50, "USD")
    currency2      = Currency.new(100, "USD")
    expected       = Currency.new(150, "USD")
    actual         = currency + currency2
    assert_equal(expected, actual)
  end

  def test_equal_method
    currency       = Currency.new(100, "USD")
    currency2      = Currency.new(100, "USD")
    expected       = Currency.new(100, "USD") == Currency.new(100, "USD")
    actual         = currency == currency2
    assert_equal(expected, actual)
  end

  def test_custom_error
    assert(DifferentCurrencyCodeError)  # => true
  end

  def test_not_equal_method
    currency       = Currency.new(100, "USD")
    currency2      = Currency.new(50, "GPD")
    expected       = Currency.new(100, "USD") != Currency.new(50, "GPD")
    actual         = currency != currency2
    assert_equal(expected, actual)
  end

  def test_minus_method
    currency       = Currency.new(75, "USD")
    currency2      = Currency.new(50, "USD")
    expected       = Currency.new(25, "USD")  
    actual         = currency - currency2     # => #<Currency:0x007feded0b1f20 @amt_to_convert=25, @ccode="USD">
    assert_equal(expected, actual)            # => true

    currency       = Currency.new(25, "USD")   # => #<Currency:0x007feded0b18e0 @amt_to_convert=25, @ccode="USD">
    currency2      = Currency.new(50, "USD")   # => #<Currency:0x007feded0b1660 @amt_to_convert=50, @ccode="USD">
    expected       = Currency.new(-25, "USD")  # => #<Currency:0x007feded0b1368 @amt_to_convert=-25, @ccode="USD">
    actual         = currency - currency2      # => #<Currency:0x007feded0b1098 @amt_to_convert=-25, @ccode="USD">
    assert_equal(expected, actual)             # => true
  end

  def test_plus_with_error
    currency       = Currency.new(75, "USD")      # => #<Currency:0x007feded0bbca0 @amt_to_convert=75, @ccode="USD">
    currency2      = Currency.new(25, "GPD")      # => #<Currency:0x007feded0bb908 @amt_to_convert=25, @ccode="GPD">
    assert_raises(DifferentCurrencyCodeError) do
      total_amt = currency + currency2
    end                                           # => #<DifferentCurrencyCodeError: DifferentCurrencyCodeError>
  end

  def test_minus_with_error
    currency       = Currency.new(100, "USD")     # => #<Currency:0x007feded0b00f8 @amt_to_convert=100, @ccode="USD">
    currency2      = Currency.new(25, "GPD")      # => #<Currency:0x007feded0b0f80 @amt_to_convert=25, @ccode="GPD">
    assert_raises(DifferentCurrencyCodeError) do
      total_amt = currency - currency2
    end                                           # => #<DifferentCurrencyCodeError: DifferentCurrencyCodeError>
  end

  def test_multiply_method
    currency       = Currency.new(10, "USD")             # => #<Currency:0x007feded0b99a0 @amt_to_convert=10, @ccode="USD">
    multiple       = 3                                   # => 3
    expected       = 30                                  # => 30
    actual         = currency.amt_to_convert * multiple  # => 30
    assert_equal(30, actual)                             # => true
  end
end
