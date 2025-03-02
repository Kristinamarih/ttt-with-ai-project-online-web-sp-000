class Game 
  
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]
  
  def board 
    @board
  end
  
  def player_1
    @player_1
  end
  
  def player_2
    @player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |index|
      board.cells[index[0]] == board.cells[index[1]] && 
       board.cells[index[1]] == board.cells[index[2]] && 
       board.cells[index[0]] != " "
    end
  end
  
  def draw?
    !won? && board.full?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      return board.cells[won?[0]]
    end
  end
  
  def turn
    input = current_player.move(board).to_i 
    if board.valid_move?(input)
      board.update(input, current_player)
    else 
      current_player.move(board)
    end
  end
  
  def play 
    until over?
     turn 
   end
    if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
      elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
