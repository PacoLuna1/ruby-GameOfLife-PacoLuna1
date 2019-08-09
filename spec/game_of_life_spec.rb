require "game_of_life/game"
require 'game_of_life/menu'
require 'game_of_life/board'

describe GameOfLife::Game do
  let(:game_life) {GameOfLife::Game.new(3,Array.new(3) { Array.new(3) })}

  describe '#kill_cell' do 

    it 'kill a cell when is between 0 or 1 cell for underpopulation.' do
      expect(game_life.kill_cell(0)).to eq(0)
      expect(game_life.kill_cell(1)).to eq(0)
    end

    it "The cell lives on to the next generation" do
      expect(game_life.kill_cell(3)).to eq(1)
    end

    it 'kill a cell when is between 4 to 8  cell for overpopulation.' do
      expect(game_life.kill_cell(4)).to eq(0)
      expect(game_life.kill_cell(5)).to eq(0)
      expect(game_life.kill_cell(6)).to eq(0)
      expect(game_life.kill_cell(7)).to eq(0)
      expect(game_life.kill_cell(8)).to eq(0)
    end
  end


  describe '#born_cell' do 
    it 'Create a cell when is between 3 cells' do 
      expect(game_life.kill_cell(3)).to eq(1)
    end
  end

  describe '#stop_game' do 
    it 'Will stop everything if user clicks 1' do
      expect(game_life.stop_game(1)).to eq(true)
    end
  end
end
  
