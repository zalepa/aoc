# frozen_string_literal: true

input = File.read('01.txt')

floor = 0

first_trip_to_basement = 0

input.each_char.with_index do |c, i|
  floor += 1 if c == '('
  floor -= 1 if c == ')'
  first_trip_to_basement = (i + 1) if floor == -1 && first_trip_to_basement.zero?
end

puts "Part A: #{floor}"
puts "Part B: #{first_trip_to_basement}"
