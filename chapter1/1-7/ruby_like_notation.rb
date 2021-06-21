# nilガード
def num1(num)
  puts num ||= 10
end

def num2(num)
  puts num || (num = 10)
end

num1(nil)
num1(3)
num2(nil)
num2(3)

class Hoge
  def len1
    @hoge ||= []
    puts @hoge.length
  end
  def len2
    puts @hoge.length
  end
end

h = Hoge.new
# h.len2
# h.len1

# ぼっち演算子
obj = nil
p obj&.name
#p obj.name

# %記法
p %w(apple banana orange)
p %i(apple banana orange)

# map(), &:
class User
  attr_accessor :name
end

u1 = User.new
u2 = User.new
u3 = User.new
u1.name = "大場寧子"
u2.name = "小芝美由紀"
u3.name = "小田井優"
users = [u1, u2, u3]
# p users
name_arr1 = users.map { |user| user.name }
name_arr2 = users.map(&:name)
p name_arr1
p name_arr2