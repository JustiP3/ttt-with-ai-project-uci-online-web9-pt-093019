module Players
  class Computer < Player
    def move(board_instance)
      corners = [1,3,7,9]
      offence_defence = "0" #0 = offence, 1 = defence

      A = Game.WIN_COMBINATIONS

      if board_instance.turn_count == 0
        position = corners[rand(0,4)].to_s
      elsif board_instance.turn_count == 1
        position = "5"
      end
  #    position = rand(9)
  #    until(board_instance.valid_move?(position))
  #      position = rand(10)
  #    end
  #    position.to_s
    end
  end
end
