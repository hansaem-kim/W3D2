require 'byebug'
require_relative './board.rb'

class HumanPlayer 

    attr_reader :board

    def initialize
        @board = Board.new(self.board_size)
    end



    def get_user_guess
        print 'Enter two numbers separated by a space.'
        position = gets.chomp.split(' ').map(&:to_i)
    end

    def board_size
        size = 1
        until size.even?
            puts "Enter any even number for size of Board: "
            return size = gets.chomp.to_i
        end
    end


end