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

  def ==(equalto)
    @amt_to_convert == equalto.amt_to_convert && @ccode == equalto.ccode
  end

  def !=(notequal)
    !(@amt_to_convert == notequal.amt_to_convert && @ccode == notequal.ccode)
  end

  def +(add)
    if add.is_a?(Currency)
      raise DifferentCurrencyCodeError if @ccode != add.ccode
      Currency.new(@amt_to_convert + add.amt_to_convert, @ccode)
    end
  end

  def -(minus)
    if minus.is_a?(Currency)
      raise DifferentCurrencyCodeError if @ccode != minus.ccode
      Currency.new(@amt_to_convert - minus.amt_to_convert, @ccode)
    end
  end

  def *(multiply)
    if multiply.is_a?(Currency)
      raise DifferentCurrencyCodeError if multiply.is_a?(Float) == false ||
      multiply._is_a?(Fixnum) == false
      new_convert = Currency.new(@amt_to_convert * multiply, @ccode)
    end
  end

end
