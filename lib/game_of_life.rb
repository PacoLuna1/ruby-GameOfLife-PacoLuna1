require './game_of_life/game'
require './game_of_life/menu'

alive = 1
dead = 0

print 'Introduce a size of the Game of life grid:'
size = gets.chomp.to_i
game = GameOfLife::Game.new(size)
board = GameOfLife::Board.new(size)
menu = GameOfLife::Menu.new(game,board)
game.show_grid
until play_again? 

end
