# frozen_string_literal: true

# a mover
class Mover
  attr_reader :presents

  def initialize
    @pos = {x: 0, y: 0}
    @presents = {}
  end

  def move(dir)
    deposit_present
    @pos[:y] += 1 if dir == '^'
    @pos[:y] -= 1 if dir == 'v'
    @pos[:x] += 1 if dir == '>'
    @pos[:x] -= 1 if dir == '<'
    deposit_present
  end

  def deposit_present
    idx = "#{@pos[:x]}-#{@pos[:y]}"
    @presents[idx] ? @presents[idx] += 1 : @presents[idx] = 1
  end

  def execute(cmds)
    cmds.each_char { move(_1) }
  end
end

mover = Mover.new
mover.execute(File.read('03.txt'))
puts 'Part A: ', mover.presents.count


cmd = File.read('03.txt')
santa = cmd.chars.select.with_index { |e, i| e if i.even? }
robo_santa = cmd.chars.select.with_index { |e, i| e if i.odd? }

santa_mover = Mover.new
santa_mover.execute(santa.join)
robo_santa_mover = Mover.new
robo_santa_mover.execute(robo_santa.join)

puts 'Part B: ',  santa_mover.presents.merge(robo_santa_mover.presents).count