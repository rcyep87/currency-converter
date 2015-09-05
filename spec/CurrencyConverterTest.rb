require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/CurrencyConverter.rb'

class CurrencyConverterTest < Minitest::Test

  def test_currency_exists
    assert(CurrencyConverter)
  end

  def test_custom_error
    assert(UnknownCurrencyCodeError)
  end

  # def test_conversion_method
  #   initial_currency = CurrencyConverter.new(50, "USD")
  #   expected         = CurrencyConverter.new(37, "EUR")
  #   actual           = initial_currency.amt_to_convert * expected.currency_converter["EUR"]
  #   assert_equal(expected, actual)
  # end

end
