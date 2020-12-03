map = []

File.readlines('3.txt').each do |line|
  map.push line.strip.each_char.to_a
end

def part_one(map, right: 3, down: 1)
  x = 0
  y = 0

  width = map[0].length
  height = map.length
  tree_count = 0

  while y < height
    tree_count += 1 if map[y][x] == '#'
    y = y + down
    x = x + right
    x = x - width if x >= width
  end

  tree_count
end

puts part_one(map, right: 3, down: 1)

patterns = [
  { right: 1, down: 1 },
  { right: 3, down: 1 },
  { right: 5, down: 1 },
  { right: 7, down: 1 },
  { right: 1, down: 2 },
]

def part_two(map, patterns)
  # TODO: there is definitely a way to do this in one line
  x = 1
  patterns.each do |pattern|
    x = x * part_one(map, right: pattern[:right], down: pattern[:down])
  end
  x
end

puts part_two(map, patterns)
