# frozen_string_literal: true

require './game_of_life/game'
require './game_of_life/menu'

alive = 1
dead = 0
answer = 0
stop = false
print 'Introduce a size of the Game of life grid:'
size = gets.chomp.to_i

grid = Array.new(size) { Array.new(size) }

game = GameOfLife::Game.new(size, grid, alive, dead)
menu = GameOfLife::Menu.new(size, game)
game.reset_game
game.show_grid
while game.play_again?(answer) != 1
  menu.print_menu
  menu.start_game
  game.check_grid(stop)
end
