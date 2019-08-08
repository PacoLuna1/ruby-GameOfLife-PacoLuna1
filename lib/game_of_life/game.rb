module GameOfLife
  class Game 
    def initialize(size,grid,alive,dead)
      @size = size
      @grid = grid
      @alive = alive
      @dead = dead
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


    def update_grid(position_row, position_column)
      (@size * @size).times do
        @grid[position_row][position_column] = 1
      end
      show_grid
    end

    def reset_game
      # @position = 0
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |_value, column|
          @grid[row][column] = 0
          column + 1
        end
        row += 1
      end
    end

    def check_cell()
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |_value, column|
          current_position = @grid[row][column]  
          if current_position == @alive 
            # alive_conditions(current_position)   
            # puts "#{row}#{column}"  

              
            if column - 1 < 0 
              sides_condition = @grid[row][column..column+1]
              top_condition =  row - 1 < 0 ? 0 : @grid[row-1][column..column+1]
              bottom_condition =  row + 1 > @size - 1 ? 0 : @grid[row+1][column..column+1]
            else 
              sides_condition = @grid[row][column-1..column+1] 
              top_condition =  row - 1 < 0 ? 0 : @grid[row-1][column-1..column+1]
              bottom_condition =  row + 1 > @size - 1 ? 0 : @grid[row+1][column-1..column+1]
            end
             

            

          puts "top condition#{top_condition}"
          puts "bottom condition #{bottom_condition }"
          puts "rsi condition #{sides_condition }"

          elsif current_position == @dead
            dead_conditions(current_position)
          end
          column + 1
        end
        row += 1
      end
    end
     
    def dead_conditions(current_position)
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |value, column|
        
       
        column + 1
        end
      row += 1
      end      
    end

    def alive_conditions(current_position)
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |value, column|
         
       
        column + 1
        end
      row += 1
      end      
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


    def stop_game(stop)
      if stop == 1
        puts 'Do you want to play again? (0) Yes (1) No'
        answer = gets.chomp.to_i  
        play_again?(answer)
      else 
        false
      end
    end

    def play_again?(answer)
      if answer == 0
        reset_game 
      else
        game_over
      end
    end

    def game_over
      exit
    end
    

  end
end
