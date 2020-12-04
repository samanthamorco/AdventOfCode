require 'pry'
file = File.readlines('../puzzles/4.txt')

def parse_file(file)
  file.join.split("\n\n").map(&:split).map do |passport|
    passport_obj = {}
    passport.each do |attr|
      split_attr = attr.split(':')
      passport_obj[split_attr[0]] = split_attr[1]
    end
    passport_obj
  end
end

def has_correct_fields(passport)
  required_fields = %w[byr iyr eyr hgt hcl ecl pid]

  (passport.keys.sort - ['cid']) == required_fields.sort
end

def part_one(passports)
  valid_passports = 0

  passports.each { |passport| valid_passports += 1 if has_correct_fields(passport) }

  valid_passports
end

def part_two(passports)
  valid_passports = 0

  passports.each do |passport|
    next unless has_correct_fields(passport)

    byr = passport['byr'].to_i
    iyr = passport['iyr'].to_i
    eyr = passport['eyr'].to_i
    hgt = passport['hgt']
    hcl = passport['hcl']
    ecl = passport['ecl']
    pid = passport['pid']

    next unless byr.between?(1920, 2002)
    next unless iyr.between?(2010, 2020)
    next unless eyr.between?(2020, 2030)
    next unless validate_height(hgt)
    next unless hcl.match(/\A#[0-9a-f]{6}\z/)
    next unless %w[amb blu brn gry grn hzl oth].include?(ecl)
    next unless pid.match(/\A\d{9}\z/)

    valid_passports += 1
  end

  valid_passports
end

def validate_height(hgt)
  if hgt =~ /\A\d+cm\z/
    hgt.to_i.between?(150, 193)
  elsif hgt =~ /\A\d+in\z/
    hgt.to_i.between?(59, 76)
  end
end

puts part_one(parse_file(file))
puts part_two(parse_file(file))
