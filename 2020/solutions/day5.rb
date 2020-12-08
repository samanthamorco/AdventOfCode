require 'pry'
file = File.read('../puzzles/5.txt')

def part_1(input)
  all_taken_seats(input).sort.last
end

def part_2(input)
  seat_ids = all_taken_seats(input).sort
  seat_ids.each_with_index do |seat, idx|
    return seat + 1 if seat_ids[idx + 1] != seat + 1
  end
end

def all_taken_seats(input)
  input.split("\n").map do |row|
    row_search = row[0...7].split('').map! { |r| row_to_number(r) }
    seat_row = binary_search([0, 127], row_search)
    col_search = row[7..].split('').map { |c| col_to_number(c) }
    seat_something = binary_search([0, 7], col_search)
    (seat_row * 8) + seat_something
  end
end

def row_to_number(letter)
  letter == 'F' ? 0 : 1
end

def col_to_number(letter)
  letter == 'L' ? 0 : 1
end

def binary_search(range, input)
  x = input.shift

  if input.empty?
    x == 0 ? range.first : range.last
  else
    front = [range.first, midpoint(range.first, range.last)]
    back = [midpoint(range.first, range.last) + 1, range.last]

    x == 0 ? binary_search(front, input) : binary_search(back, input)
  end
end

def midpoint(low, high)
  low + ((high - low) / 2)
end

puts part_1(file)
puts part_2(file)
