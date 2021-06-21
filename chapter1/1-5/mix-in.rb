module Chatting
  def chat
    "hello"
  end
end

module Weeping
  def weep
    "しくしく"
  end
end

class Human
  include Chatting
  include Weeping
end

class Dog
  include Chatting
end

h = Human.new
puts h.chat
puts h.weep

d = Dog.new
puts d.chat
