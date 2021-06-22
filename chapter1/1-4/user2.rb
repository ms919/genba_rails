class User
  attr_accessor :name
  attr_reader :birthday
  attr_writer :email
  def initialize(attrs = {})
    @name = attrs[:name]
    @birthday = attrs[:birthday]
    @email = attrs[:email]
  end
end