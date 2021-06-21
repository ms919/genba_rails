class Person
  attr_accessor :first_name, :last_name, :age
  def name(full: true, with_age: true)
    n = if full
          "#{last_name}　#{first_name}"
        else
          "#{first_name}"
        end
    n += "(#{age})" if with_age
    return n
  end
end

p = Person.new
p.first_name = "太郎"
p.last_name = "浦島"
p.age = 100
p p.name
p p.name(full: false)
p p.name(with_age: false)
p p.name(with_age: false, full: false)