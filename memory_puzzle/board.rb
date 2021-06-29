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
            letter = alphabet.sample
            alphabet.delete(letter)

            2.times do

                card = Card.new(letter)
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

    def render
        print "  "
        
        (0...@size).each do |num|
            print num.to_s + " "
        end

        puts " "
        counter = (0...@size).to_a
        @grid.each do |sub_array|
            print counter.shift.to_s + " "
            sub_array.each do |card|
                if card.face_up
                    print card.value + ' '
                else
                    print '  ' 
                end
            end
            puts "   "
        end
      
    end

    def won?
        @grid.each do |sub_array|
            return false if sub_array.any? do |card| 
                !card.face_up
            end
        end
        true
    end

    def reveal(guess_pos)
        row, col = guess_pos
        @grid[row][col].reveal unless @grid[row][col].face_up
        @grid[row][col].value
    end

end
