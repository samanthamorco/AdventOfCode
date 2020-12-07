file = File.read('../puzzles/6.txt').split("\n\n")

def part_one(file)
  file.sum { |group| group.chars.reject { |g| g == "\n" }.uniq.count }
end

def part_two(file)
  file.sum do |group|
    members = group.split
    count = {}
    members.each do |member|
      member.chars.each do |char|
        if count[char]
          count[char] += 1
        else
          count[char] = 1
        end
      end
    end

    count.select { |_, v| v == members.size }.keys.count
  end
end

puts part_one(file)
puts part_two(file)
