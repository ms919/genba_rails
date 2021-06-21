class Person
  attr_writer :money
  def initialize(money)
    @money = money
  end
  def billionaire?
    @money >= 1000000000
  end
end