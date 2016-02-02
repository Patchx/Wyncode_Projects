def bill
  puts "THANKS FOR EATING AT JOE'S DINER!"
  puts "Please enter the bill:"
  bill = gets.chomp.to_f
  return bill.round(2)
end

def tip
  puts "Please enter the tip.  For example, 20% would be 20:"
  tip = gets.chomp.to_f
  tip = tip/100
  return tip
end

def people
  puts "Please enter the number of people:"
  people = gets.chomp.to_i
  return people
end

def calc (total, tip, people)
  output = total * tip
  output += total
  puts "The total bill is: $%0.2f" % output
  output = output / people
  return output
end

def test
  puts "------------tests-------------------"
  puts "".to_i
  puts 1.5.to_i
  puts -1.5.to_i
  puts "".to_f
  puts 1.to_f
  puts -1.to_f
  puts calc(38.335,20,54)
end

b=bill
t=tip
p=people
c=calc(b,t,p)
puts "Your total is $%0.2f" % c

test
