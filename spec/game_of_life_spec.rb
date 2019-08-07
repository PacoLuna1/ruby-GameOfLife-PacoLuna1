require "game_of_life/game"
require 'game_of_life/menu'

describe GameOfLife::Game do
  let(:game_life) {GameOfLife::Game.new}

  describe '#kill_cell' do 
    it 'kill a cell when accomplish a certain condition' do
      expect(game_life.kill_cell(2,3)).to eq(grid[2][3] == '   ')
    end
  end

  describe '#check_cell' do 
    it 'kill a cell when overpopulation(less than 2)' do 
      expect(game_life.check_cell).to eq(game_life.kill_cell(2,3))
    end
    it 'Kill a cell when underpopulation(more than 3)' do
      expect(game_life.check_cell).to eq(game_life.kill_cell(2,3))
    end
  end

  describe '#born_cell' do 
    it 'born a cell when three neighbours alive' do 
      expect(game_life.born_cell(2,1)).to eq(grid[2][1] == ' 0 ')
    end
  end

  describe '#position_cell' do
    it 'choose a position in the grid for the cells' do 
      expect(game_life.position_cell(2,1)).to eq(grid[2][1] == ' 0 ')
    end
  end

  describe '#create_grid' do 
    it 'receives a size of the grid' do 
      expect(game_life.create_grid(5)).to eq(grid[5][5])
    end
  end


end
  
  
