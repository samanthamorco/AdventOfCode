inputs = File.readlines('../puzzles/2.txt').map!(&:split)

def part1(inputs)
  valid_passwords = 0
  inputs.each do |input|
    p input

    char_range = input[0].split('-')
    char = input[1].gsub(':', '')
    char_count = input[2].count(char)
    puts(char_range[0].to_i <= char_count && char_count <= char_range[1].to_i)
    valid_passwords += 1 if char_range[0].to_i <= char_count && char_count <= char_range[1].to_i
  end

  valid_passwords
end

def part2(inputs)
  valid_passwords = 0

  inputs.each do |input|
    char_range = input[0].split('-').map!(&:to_i)
    char = input[1].gsub(':', '')
    password = input[2]

    if (password[char_range[0] - 1] == char || password[char_range[1] - 1] == char)
      next if (password[char_range[0] - 1] == char && password[char_range[1] - 1] == char)

      valid_passwords += 1
    end
  end

  valid_passwords
end

puts part1(inputs)
puts part2(inputs)
