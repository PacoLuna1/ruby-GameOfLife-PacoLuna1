# frozen_string_literal: true

require './game_of_life/game'
require './game_of_life/menu'
require './game_of_life/board'

alive = 1
dead = 0
answer = 0
stop = false
print 'Introduce a size of the Game of life grid:'
size = gets.chomp.to_i

grid = Array.new(size) { Array.new(size) }
board = GameOfLife::Board.new(size, grid, alive, dead)
game = GameOfLife::Game.new(size, grid)
menu = GameOfLife::Menu.new(size, game, board)
board.reset_game
game.show_grid
while game.play_again?(answer) != 1
  menu.print_menu
  menu.start_game
  board.check_grid(stop)
end
