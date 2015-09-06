require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

require_relative '../lib/CurrencyConverter.rb'  # => true

class CurrencyConverterTest < Minitest::Test

  def test_currency_exists
    assert(CurrencyConverter)  # => true
  end

  def test_custom_error
    assert(UnknownCurrencyCodeError)  # => true
  end

  def test_converter
    initial          = CurrencyConverter.new(50, "USD")
    expected         = CurrencyConverter.new(37, "EUR")
    assert_equal(expected, CurrencyConverter.new.convert(initial, new_ccode))
  end

end

# >> Run options: --seed 51551
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m[41m[37mE[0m[38;5;154m.[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.000937s, 3202.7740 runs/s, 2135.1827 assertions/s.
# >>
# >>   1) Error:
# >> CurrencyConverterTest#test_converter:
# >> ArgumentError: wrong number of arguments (2 for 0)
# >>     /Users/ryep/theironyard/week2/day4/Currency_Converter/lib/CurrencyConverter.rb:13:in `initialize'
# >>     /Users/ryep/theironyard/week2/day4/Currency_Converter/spec/CurrencyConverterTest.rb:17:in `new'
# >>     /Users/ryep/theironyard/week2/day4/Currency_Converter/spec/CurrencyConverterTest.rb:17:in `test_converter'
# >>
# >> 3 runs, 2 assertions, 0 failures, 1 errors, 0 skips
