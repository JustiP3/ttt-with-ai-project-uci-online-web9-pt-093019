class Game
  WIN_COMBINATIONS = [
    [0,3,6], [1,4,7], [2,5,8], #vertical wins
    [0,1,2], [3,4,5], [6,7,8], #horizontal wins
    [0,4,8], [2,4,6]          #diagonal wins
  ]

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1# if player_1.class == Player
    @player_2 = player_2# if player_2.class == Player
    play
  end

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    winning_combination = []
    won = false

    WIN_COMBINATIONS.each do |combination|

      potential_win = combination.select {|index| board.cells[index] == player_1.token}
      if potential_win.size == 3
        won = true
        winning_combination = combination
      end

      potential_win = combination.select {|index| board.cells[index] == player_2.token}
      if potential_win.size == 3
        won = true
        winning_combination = combination
      end
    end

    if board.full? && won == false
      return false
    elsif won == true
      return winning_combination
    end
  end

  def draw?
    if board.full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    combo = won?
    winning_token = ""

    if combo
      winning_token = board.cells[combo[0]]
    end

    if winning_token == player_1.token
      player_1.token
    elsif winning_token == player_2.token
      player_2.token
    end
  end

  def turn
    pos = current_player.move(board)
    board.update(pos, current_player) unless pos == 'exit'

    if player_2.class == Players::Computer && player_1.class == Players::Computer
      puts "Press enter to continue."
      gets
    end
    pos
  end

  def play
    escape_flag = ""
    until over? || escape_flag == "exit"
      unless  player_1.class == Players::Human && player_2.class == Players::Computer && current_player == player_2
      board.display 
      escape_flag = turn
    end
    board.display unless escape_flag == "exit"
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end #end of class
