class DifferentCurrencyCodeError < StandardError
  # def message
  #   puts "You're trying to compare two different currencies. Please try again."
  # end
end

class Currency
  attr_reader :amt_to_convert, :ccode

  def initialize(amt_to_convert, ccode)
    @amt_to_convert = amt_to_convert
    @ccode = ccode
  end

  def ==(other)  #this is required to make the "No visible difference" error go away
    @amt_to_convert == other.amt_to_convert && @ccode == other.ccode
  end

  def +(other)
    if other.is_a?(Currency)
      total_amt = Currency.new(@amt_to_convert + other.amt_to_convert, @ccode)
      total_amt
    else
      puts "Error!"
    end
    # Currency.new(@amt_to_convert + other.amt_to_convert, @ccode)
  end

end
