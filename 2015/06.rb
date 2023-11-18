class Grid
  def initialize(size)
    @cells = Array.new(size, 0)
    @cells = @cells.map { Array.new(size, 0) }
  end

  def width
    @cells[0].length
  end

  def height
    @cells.length
  end

  def cmd(s)
    m = s.match(/(turn on|turn off|toggle) (\d*,\d*) through (\d*,\d*)/)
    cmd = m[1]
    a = m[2].split(',').map(&:to_i)
    b = m[3].split(',').map(&:to_i)
    matrix = generate_rectangle_matrix(a, b)
    turn_on(matrix) if cmd == 'turn on'
    turn_off(matrix) if cmd == 'turn off'
    toggle(matrix) if cmd == 'toggle'
  end

  def turn_on(matrix)
    matrix.each do |r|
      r.each do |coor|
        next if @cells[coor[0]][coor[1]].nil?
        @cells[coor[0]][coor[1]] = 1 
      end
    end
  end

  def turn_off(matrix)
    matrix.each do |r|
      r.each do |coor|
        next if @cells[coor[0]][coor[1]].nil?
        @cells[coor[0]][coor[1]] = 0
      end
    end
  end

  def toggle(matrix)
    matrix.each do |r|
      r.each do |coor|
        next if @cells[coor[0]][coor[1]].nil?
        if @cells[coor[0]][coor[1]] == 0
          @cells[coor[0]][coor[1]] = 1 
        elsif
          @cells[coor[0]][coor[1]] = 0
        end
      end
    end
  end

  def on
    cnt = 0
    @cells.each do |r|
      r.each do |c|
        cnt += c
      end
    end
    cnt
  end

  private 

  def generate_rectangle_matrix(corner1, corner2)
    x1, y1 = corner1
    x2, y2 = corner2
  
    min_x, max_x = [x1, x2].minmax
    min_y, max_y = [y1, y2].minmax
  
    matrix = []
  
    (min_x..max_x).each do |x|
      row = []
      (min_y..max_y).each do |y|
        row << [x, y]
      end
      matrix << row
    end
  
    matrix
  end
end

g = Grid.new(1000)
lines = File.readlines('06.txt', chomp: true)
lines.each { g.cmd(_1) }
puts 'Part A:', g.on


class ImprovedGrid < Grid
  def turn_on(matrix)
    matrix.each do |r|
      r.each do |coor|
        next if @cells[coor[0]][coor[1]].nil?
        @cells[coor[0]][coor[1]] += 1 
      end
    end
  end

  def turn_off(matrix)
    matrix.each do |r|
      r.each do |coor|
        next if @cells[coor[0]][coor[1]].nil?
        next if @cells[coor[0]][coor[1]] == 0
        @cells[coor[0]][coor[1]] -= 1
      end
    end
  end

  def toggle(matrix)
    matrix.each do |r|
      r.each do |coor|
        next if @cells[coor[0]][coor[1]].nil?
        @cells[coor[0]][coor[1]] += 2
      end
    end
  end

  def total_brightness
   on 
  end
end

g = ImprovedGrid.new(1000)
lines = File.readlines('06.txt', chomp: true)
lines.each { g.cmd(_1) }
puts 'Part B:', g.total_brightness