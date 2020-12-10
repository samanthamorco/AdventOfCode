require 'pry'
file = File.readlines('../puzzles/9.txt').map(&:to_i)

def part_one(numbers)
  first_25 = numbers[0...25]

  idx = 25

  find_pair(numbers, first_25, idx)
end

def find_pair(array, subarray, idx)
  return 'idk did not find anything weird' if idx == array.length - 1

  current_num = array[idx]

  has_pair = subarray.combination(2).to_a.map do |combo|
    combo if combo[0] + combo[1] == current_num
  end

  if has_pair.any?
    idx += 1
    subarray.shift
    subarray.push(current_num)
    find_pair(array, subarray, idx)
  else
    return current_num
  end
end

def part_two(numbers)
  sum = part_one(numbers)

  range = find_contiguous_range(sum, numbers)
  range.min + range.max
end

def find_contiguous_range(sum, numbers)
  numbers.each_with_index do |num, idx|
    range = complete_range(idx, num, sum, numbers)
    next if range.nil?

    return range
  end
end

def complete_range(idx, num, sum, numbers)
  range = [num]
  numbers[idx + 1..].each do |next_num|
    range << next_num
    return range if range.sum == sum
    return nil if range.sum > sum
  end
end

puts part_one(file)
puts part_two(file)
