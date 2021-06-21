class Book
  def title
    puts "本のタイトル"
  end
end

class Magazine < Book
  def title
    puts "雑誌のタイトル"
  end
end

class Manga < Book
  def title
    super
    puts "マンガのタイトル"
  end
end

mgz = Magazine.new
mgz.title
mng = Manga.new
mng.title