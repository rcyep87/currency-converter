require_relative '../lib/CurrencyClass.rb'  # => true

class UnknownCurrencyCodeError
  def message
    "You're asking me to convert something I don't know!!"
  end
end

class CurrencyConverter

  attr_reader :currency_vals  # => nil

  def initialize
    @currency_vals = { :USD => 1.0, :EUR => 0.74 }
  end

  def convert(initial_currency, new_ccode)
    initial_currency = Currency.new(initial_currency, new_ccode)
    new_currency = Currency.new(initial_currency.*(@currency_vals[new_ccode.to_sym]), new_ccode)
  end

end
