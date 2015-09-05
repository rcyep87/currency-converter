require_relative '../lib/CurrencyClass.rb'

class UnknownCurrencyCodeError
  def message
    "You're asking me to convert something I don't know!!"
  end
end

class CurrencyConverter

  attr_reader :ccode, :amt_to_convert, :currency_converter

  def initialize(amt_to_convert, ccode)
    @currency_converter = {"USD" => 1.0, "EUR" => 0.74}
    @amt_to_convert = rate
    @ccode = ccode
  end

end
