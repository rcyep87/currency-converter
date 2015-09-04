require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/CurrencyClass.rb'

class CurrencyClassTest < Minitest::Test

  def test_currency_exists
    assert(Currency) #checks to see if class exists in file
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
    assert(DifferentCurrencyCodeError)
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
    actual         = currency - currency2
    assert_equal(expected, actual)

    currency       = Currency.new(25, "USD")
    currency2      = Currency.new(50, "USD")
    expected       = Currency.new(-25, "USD")
    actual         = currency - currency2
    assert_equal(expected, actual)
  end

  def test_plus_with_error
    currency       = Currency.new(75, "USD")
    currency2      = Currency.new(25, "GPD")
    assert_raises(DifferentCurrencyCodeError) do
      total_amt = currency + currency2
    end
  end
end
