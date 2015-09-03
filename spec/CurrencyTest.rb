require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/CurrencyClass.rb'

class CurrencyClassTest < Minitest::Test

  def test_currency_exists
    assert(Currency) #checks to see if class exists in file
  end


end
