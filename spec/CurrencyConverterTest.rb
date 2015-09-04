require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/CurrencyConverter.rb'

class CurrencyConverterTest < Minitest::Test

  def test_currency_exists
    assert(CurrencyConverter)
  end

end
