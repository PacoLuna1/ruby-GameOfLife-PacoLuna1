module GameOfLife
  class board
    def initialize(alive,dead)
      @alive = alive
      @dead = dead
    end

    def update_grid(position_row, position_column)
      (@size * @size).times do
        @grid[position_row][position_column] = 1
      end
      game.show_grid
      @position += 1
    end

    def reset_grid
      @position = 0
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |_value, column|
          @grid[row][column] = 0
          column + 1
        end
        row += 1
      end
    end



    def check_grid
      
    end

    def check_cell()
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |_value, column|
          if @grid[row][column] == @alive 
        
          elsif @grid[row][column] == @dead
            track_coditions()
          end
          column + 1
        end
        row += 1
      end
    end
     
    def track_coditions()
      
    end

    def are_alive?
      if position_cell == 1
        true
      else
        false
      end
    end

    def born_cell()
      current_position = 1
    end

    def kill_cell()
      current_position = 0
    end


  end
end