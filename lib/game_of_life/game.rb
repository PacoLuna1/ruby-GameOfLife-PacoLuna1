# frozen_string_literal: true

module GameOfLife
  # A game of life
  class Game
    def initialize(size, grid, alive, dead)
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
      puts '---------------------'
    end

    def update_grid(position_row, position_column)
      (@size * @size).times do
        @grid[position_row][position_column] = 1
      end
      show_grid
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

    def check_grid(stop)
      until stop_game(stop)
        check_cell
        puts 'Stop(1) Next(2)'
        stop = gets.chomp.to_i
        stop_game(stop)
      end
      puts 'Do you want to play again? (0) Yes (1) No'
      answer = gets.chomp.to_i
      play_again?(answer)
    end

    def check_cell
      @grid.each_with_index do |vector, row|
        vector.each_with_index do |_value, column|
          vitality = @grid[row][column]
          if vitality == @alive
            @grid[row][column] = analize_grid(column, row, vitality)
          elsif vitality == @dead
            @grid[row][column] = analize_grid(column, row, vitality)
          end
          column += 1
          show_grid
        end
        row += 1
      end
    end
    def analize_grid(column, row, vitality)
      pre = (row - 1)
      pos = (row + 1)
      if (column - 1).negative?
        sides = @grid[row][column..column + 1]
        top =  pre.negative? ? [0] : @grid[row - 1][column..column + 1]
        bottom = pos > @size - 1 ? [0] : @grid[row + 1][column..column + 1]
      else
        sides = @grid[row][column - 1..column + 1]
        top =  pre.negative? ? [0] : @grid[row - 1][column - 1..column + 1]
        bottom = pos > @size - 1 ? [0] : @grid[row + 1][column - 1..column + 1]
      end
      sum_cells(sides, top, bottom, vitality)
    end

    def sum_cells(sides, top, bottom, vitality)
      total = 0
      sides.map { |value| total += value }
      top.map { |value| total += value }
      bottom.map { |value| total += value }
      if vitality == @alive
        kill_cell(total)
      else
        born_cell(total)
      end
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
