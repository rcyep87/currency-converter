class DifferentCurrencyCodeError < StandardError
  def message
    puts "You're trying to compare two different currencies. Please try again."
  end
end

# class DidntInitializeClass < StandardError
#   def message
#     puts "Make sure you're providing both a dollar amount and currency code!"
#   end
# end

class Currency
  attr_reader :amt_to_convert, :ccode

  def initialize(amt_to_convert, ccode)
    @amt_to_convert = amt_to_convert
    @ccode = ccode
  end

  def ==(other)
    @amt_to_convert == other.amt_to_convert && @ccode == other.ccode
  end

  def !=(other)
    !(@amt_to_convert == other.amt_to_convert && @ccode == other.ccode)
  end

  def +(other)
    if other.is_a?(Currency)
      raise DifferentCurrencyCodeError if @ccode != other.ccode
      Currency.new(@amt_to_convert + other.amt_to_convert, @ccode)
    end
  end

  def -(other)
    if other.is_a?(Currency)
      raise DifferentCurrencyCodeError if @ccode != other.ccode
      Currency.new(@amt_to_convert - other.amt_to_convert, @ccode)
    end
  end

end
