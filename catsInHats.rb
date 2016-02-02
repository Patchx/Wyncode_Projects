size_cats = 100
cats = []
size_cats.times {cats << 1}
divisor = 1
for i in 1..cats.length
  for i2 in 1..cats.length
    if i2 % divisor == 0
      cats[i2-1] *= -1
    end
  end
  divisor += 1
  #p ""
  #p i
  #p cats
end

for i in 1..cats.length
  if cats[i-1] == 1
    puts "cat #{i} has a hat at the #{size_cats}th iteration"
  else
    puts "cat #{i} does not have a hat at the #{size_cats}th iteration."
  end
end

#p cats
