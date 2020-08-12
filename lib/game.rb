require 'board'
require 'player'
# Game Controller
class Game
  def initialize
    @board = Board.new
  end

  def start
    @p1 = Player.new('Player 1')
    @p2 = Player.new('Player 2')
    @p1.next = @p2
    @p2.next = @p1
    @current_player = rand > 0.5 ? @p1 : @p2
    game_loop
  end

  def game_loop
    loop do
      @board.render
      player_move = @current_player.move
      next unless @board.mark(player_move)

      if @board.check_winner
        puts @current_player.name + ' Wins!'
        break
      end
      if @board.check_draw
        puts 'Draw!'
        break
      end
      @current_player = @current_player.next
    end
  end
end
