class Array
  # okay, I probably wouldn't *actually* do this in production code because
  # Monkeypatching Is Evil(TM)
  #
  # ...and fun ;)

  def unzip
    self.partition.with_index{ |val, idx| idx.odd? }
  end

  def sum
    self.inject(0){ |val, acc| acc += val }
  end
end

class Luhn
  def initialize(id_number)
    @id_number = id_number[0..-2]
    @check_digit = id_number[-1].to_i
  end

  def valid?
    @check_digit == calculated_checksum_digit
  end

  private

  def calculated_checksum_digit
    10 - (calculated_checksum % 10)
  end

  def calculated_checksum
    digits = @id_number.chars.map(&:to_i)
    digits.rotate! if digits.length.even?
    odds, evens = digits.unzip
    odds.sum + sum_evens(evens)
  end

  def sum_evens(evens)
    evens.map{|d| d * 2 }.join.chars.map(&:to_i).sum
  end
end
