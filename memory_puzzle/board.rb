require 'byebug'
require_relative './card.rb'

class Board 

    attr_reader :grid

    def self.create_board(n)
        Array.new(n) {Array.new(n)}
    end

    def initialize(n = 4)
        @size = n
        @grid = Board.create_board(n)
    end

    def populate
        alphabet = ("A".."Z").to_a
        (@size*@size/2).times do
            card = Card.new(alphabet.sample)
            alphabet.delete(card.value)
            2.times do
                not_nil = true
                while not_nil
                    row = rand(0...@size)
                    col = rand(0...@size)
                    if !@grid[row][col]
                        @grid[row][col] = card
                        not_nil = false
                    end
                end
            end
        end
    end

    def printer
        @grid.each do |sub_array|
            sub_array.each do |ele|
                print ele.value
            end
            puts "   "
        end
    end
end

board = Board.new(4)
board.populate
board.printer