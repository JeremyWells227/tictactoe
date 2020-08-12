# Handles player input
class Player
  attr_accessor :next
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def move
    x_coord, y_coord = ask_move
    unless [1, 2, 3].include? x_coord
      puts 'Invalid Choice!'
      return move
    end
    unless [1, 2, 3].include? y_coord
      puts 'Invalid Choice!'
      return move
    end
    [x_coord, y_coord]
  end

  def ask_move
    puts  'Syntax is: X Y'
    puts  "#{@name}: Choose your move:"
    coords = gets.strip
    x_coord, y_coord = coords.split.map(&:to_i)
    [x_coord, y_coord]
  end
end
