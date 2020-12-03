nums = File.readlines('1.txt').map!(&:to_i)

def part_1(nums)
  nums.each do |num|
    second_num = 2020 - num
    return num * second_num if nums.include?(second_num)
  end
end
puts part_1(nums)

def part_2(nums)
  nums.combination(3).find { |combo| combo.sum == 2020 }.reduce(:*)
end

puts part_2(nums)
