module GameOfLife 
  class Menu
    
    def initialize(size,game)
      @size = size
      @game = game
    end

    def print_menu
      puts'================================='
      puts' (1)Choose posicion for the cells'
      puts' (2)Leave game                      '
      puts'================================='
    end

    def start_game
      puts 'Select your option:'
      option = gets.chomp.to_i
      case option
      when 1
        @size.times do
          puts 'Introduce a row:'
          position_row = gets.chomp.to_i
          puts 'Introduce a column:'
          position_column = gets.chomp.to_i
          @game.update_grid(position_row, position_column)
        end
      when 2 
        @game.game_over
      end

    end
  end
end