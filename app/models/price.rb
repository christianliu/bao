class Price

  attr_reader :amount
  def initialize(amount)
    @amount = amount
  end

  def to_s
    "$" + "%.2f" % amount.round(2)
  end
end