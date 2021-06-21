class User
  attr_accessor :name, :address, :email
  def initialise(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @email = attributes[:email]
  end
  def profile
    "#{name}(#{address})"
  end
  def profile2
    "#{@name}(#{@email})"
  end
end