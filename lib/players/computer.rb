module Players
  class Computer < Player
    def move(board_instance)
      offence_defence = "0" #0 = offence, 1 = defence

      if board_instance.turn_count == 0
        position = "1"
      end
  #    position = rand(9)
  #    until(board_instance.valid_move?(position))
  #      position = rand(10)
  #    end
  #    position.to_s
    end
  end
end
