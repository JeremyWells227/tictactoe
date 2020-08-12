# Handles Displaying of Tic tac toe board
class Board
  def initialize
    @curr_mark = nil
    make_empty_board
  end

  X_MARK = 'X'.freeze
  HORIZONTAL_LINE = "\u2500".freeze
  CROSS = "\u253C".freeze
  VERTICAL_LINE = "\u2502".freeze
  O_MARK = 'O'.freeze
  EMPTY = ' '.freeze

  def make_empty_board
    @rows = [
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY]
    ]
  end

  def mark(coords)
    return false if marked? coords

    set_mark
    @rows[coords[1] - 1][coords[0] - 1] = @curr_mark
    true
  end

  def set_mark
    @curr_mark = if @curr_mark == O_MARK || @curr_mark.nil?
                   X_MARK
                 else
                   O_MARK
                 end
  end

  def marked?(coords)
    check = @rows[coords[1] - 1][coords[0] - 1] != EMPTY
    check
  end

  def render
    system('clear')
    puts '3' + VERTICAL_LINE + '  ' + @rows[2].join(" #{VERTICAL_LINE} ")
    puts ' ' * 4 + HORIZONTAL_LINE * 2 + CROSS + HORIZONTAL_LINE * 3 + CROSS + HORIZONTAL_LINE * 2
    puts '2' + VERTICAL_LINE + '  ' + @rows[1].join(" #{VERTICAL_LINE} ")
    puts ' ' * 4 + HORIZONTAL_LINE * 2 + CROSS + HORIZONTAL_LINE * 3 + CROSS + HORIZONTAL_LINE * 2
    puts '1' + VERTICAL_LINE + '  ' + @rows[0].join(" #{VERTICAL_LINE} ")
    puts
    puts ' ' * 4 + HORIZONTAL_LINE * 9
    puts ' ' * 4 + %w[1 2 3].join('   ')
  end

  def check_winner
    (check_rows_and_columns || check_diagonals)
  end

  def check_draw
    check = true
    @rows.each do |row|
      check = false if row.include? EMPTY
    end
  end

  private

  def check_rows_and_columns
    check1 = @rows.any? { |row| row.uniq == [X_MARK] || row.uniq == [O_MARK] }
    check2 = @rows.transpose.any? { |col| col.uniq == [X_MARK] || col.uniq == [O_MARK] }
    check1 || check2
  end

  def check_diagonals
    check3 = (@rows[2][2] == @rows[1][1] && @rows[1][1] == @rows[0][0] && @rows[0][0] != EMPTY)
    check4 = (@rows[2][0] == @rows[1][1] && @rows[1][1] == @rows[0][2] && @rows[0][2] != EMPTY)
    check3 || check4
  end
end
