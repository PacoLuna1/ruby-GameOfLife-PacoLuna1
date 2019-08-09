# frozen_string_literal: true

module GameOfLife
  # A game of life
  class Game
    def initialize(size, grid)
      @size = size
      @grid = grid
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
      puts '---------------------'
    end

    def kill_cell(total)
      total -= 1
      if total.between?(0, 1) || total.between?(4, 8)
        0
      elsif total.between?(2, 3)
        1
      end
    end

    def born_cell(total)
      if total == 3
        1
      else
        0
      end
    end

    def reset_game
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |_value, column|
          @grid[row][column] = 0
          column + 1
        end
        row += 1
      end
    end

    def stop_game(stop)
      stop == 1
    end

    def play_again?(answer)
      if answer.zero?
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
