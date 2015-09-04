require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/CurrencyClass.rb'

class CurrencyClassTest < Minitest::Test

  def test_currency_exists
    assert(Currency) #checks to see if class exists in file
  end

  def test_plus_method
    currency       = Currency.new(1, "USD") #given i have a currency
    other_currency = Currency.new(5, "USD") #when i add another currency
    expected       = Currency.new(6, "USD")
    actual         = (currency + other_currency)
    assert_equal(expected, actual)
  end

  def test_equal_method
    currency       = Currency.new(100, "USD")
    other_currency = Currency.new(100, "USD")
    expected       = Currency.new(100, "USD") == Currency.new(100, "USD")
    actual         = currency == other_currency
    assert_equal(expected, actual)
  end

  def test_custom_error
    assert(DifferentCurrencyCodeError)
  end
end
