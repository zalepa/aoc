# frozen_string_literal: true

require 'digest'

seed = 'ckczppom'

i = 0
candidate = nil

loop do
  candidate = Digest::MD5.hexdigest "#{seed}#{i}"
  i += 1
  break if candidate[0...5] == '00000'
end

puts 'Part A:', i - 1, candidate


candidate = nil

loop do
  candidate = Digest::MD5.hexdigest "#{seed}#{i}"
  i += 1
  break if candidate[0...6] == '000000'
end

puts 'Part B:', i - 1, candidate
