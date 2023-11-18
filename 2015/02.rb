# frozen_string_literal: true

# a perfect right rectangular prism
class Box
  def initialize(str)
    (length, width, height) = str.split('x').map { _1.to_i }
    @length = length
    @width = width
    @height = height
  end

  def surface_area
    2 * @length * @width + 2 * @width * @height + 2 * @height * @length
  end

  def smallest_side
    [@length * @width, @width * @height, @height * @length].sort.first
  end

  def paper_needed
    surface_area + smallest_side
  end

  def ribbon_needed
    sorted_sides = [@length, @width, @height].sort
    (sorted_sides.first * 2) + (sorted_sides[1] * 2) + sorted_sides.inject(&:*)
  end
end

boxes = File.readlines('02.txt', chomp: true).map { Box.new(_1) }
puts 'Part A: ', boxes.map(&:paper_needed ).inject(&:+)
puts 'Part B: ', boxes.map(&:ribbon_needed).inject(&:+)