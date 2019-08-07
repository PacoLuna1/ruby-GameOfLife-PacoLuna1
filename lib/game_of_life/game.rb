module GameOfLife
  class Game 
    def initialize(size)
      @size = size
      @grid = Array.new(size){Array.new(size)}
      
    end

    def show_grid
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |_value, column|
          slots = @grid[row][column]
          print column == @size - 1 ? "#{slots} \n" : " #{slots} |"
          column + 1
        end
        row += 1
      end
    end

    def play_again?
      while board.check_cells

      end
    end

    def game_over
      exit
    end
    

  end
end
