class Board
  attr_accessor :board

  def initialize(array)
    @board = array
  end

  def display
    puts "............."
    @board.each_with_index do |value, index|
      if [2, 5, 8].include?(index)
        puts "| #{value} |"
        puts "............."
      else
        print "| #{value} "
      end
    end
  end

  def update(position, marker)
    return false unless is_legal?(position)

    @board[position] = marker
    return true
  end

  def is_legal?(position)
    if position.between?(0, 8)
      true
    else
      false
    end
  end

  def win?
    combos.any? do |position|
      [board[position[0]], board[position[1]], board[position[2]]].uniq.length == 1
    end
  end

  private

  def combos
    [[0, 1, 2], [3, 4, 5], [6, 7, 8],
     [0, 4, 8], [2, 4, 6], [0, 3, 6],
     [1, 4, 7], [2, 5, 8]]
  end
end
