module Players
  class Computer < Player
    def move(board_instance)
      position = rand(9)
      until(board_instance.valid_move?(position))
        position = rand(10)
      end
      position.to_s
    end
  end
end
