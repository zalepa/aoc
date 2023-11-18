# frozen_string_literal: true

# a string
class String
  def naughty_or_nice
    return false if match(/ab|cd|pq|xy/)

    chars.select { _1 if _1 =~ /[aeiou]/ }.count > 2 && !match(/(\w)\1/).nil?
  end

  def improved_naughty_or_nice
    !match(/(\w\w).*\1/).nil? && !match(/(\w).{1}\1/).nil?
  end
end

# Test cases
# puts "ugknbfddgicrmopn".naughty_or_nice
# puts "aaa".naughty_or_nice
# puts "jchzalrnumimnmhp".naughty_or_nice
# puts "haegwjzuvuyypxyu".naughty_or_nice
# puts "dvszwmarrgswjxmb".naughty_or_nice

cnt = File.readlines('05.txt').map(&:naughty_or_nice).filter { _1 }.count
puts 'Part A:', cnt

# Test cases
# puts 'qjhvhtzxzqqjkmpb'.improved_naughty_or_nice
# puts 'xxyxx'.improved_naughty_or_nice
# puts 'uurcxstgmygtbstg'.improved_naughty_or_nice
# puts 'ieodomkazucvgmuy'.improved_naughty_or_nice

cnt = File.readlines('05.txt').map(&:improved_naughty_or_nice).filter { _1 }.count
puts 'Part B:', cnt
