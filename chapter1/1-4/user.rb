class User
  attr_accessor :name, :address, :email
  def initialize(name, address, email)
    @name = name
    @address = address
    @email = email
  end
  def profile
    "#{name}(#{address})"
  end
  def profile2
    "#{@name}(#{@email})"
  end
end