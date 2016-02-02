def max(*all)
  output = []
  all.map! do |item|
    if item.class == String
      item = item.to_f
    elsif item.class == Array
      until item.flatten!.class == NilClass # Keep trying to flatten the array until there are no sub-arrays
        item = item.flatten # Don't flatten soo much that you return a nil
      end
      item = item.max
    elsif item.class == Hash
      item = item.values.max
    end
    output.push item.to_f
  end
  return output.max
end

def test_max
  puts "Test 1:   1 & 1:                           #{max(1,1)}"
  puts "Test 2:   -1 & 1:                          #{max(-1,1)}"
  puts "Test 3:   9999999999999 & 1:               #{max(9999999999999,1)}"
  puts "Test 4:   '1' & 1:                         #{max('1',1)}"
  puts "Test 5:   '1' & '2':                       #{max('1','2')}"
  puts "Test 6:   1 & [1]:                         #{max(1,[1])}"
  puts "Test 7:   [1] & [-1]:                      #{max([1],[-1])}"
  puts "Test 8:   [1] & {'test' => 1}:             #{max([1],{"test" => 1})}"
  puts "Test 9:   1 & 2 & 3:                       #{max(1,2,3)}"
  puts "Test 10:  1:                               #{max(1)}"
  puts "Test 11:  {'test' => 1} & {'test2' => 2}:  #{max({"test" => 1},{"test2" => 2})}"
  puts "Test 12:  [[3,2],1] & [2,4]:               #{max([[3,2],1],[2,4])}"
end

test_max
