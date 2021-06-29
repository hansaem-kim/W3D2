require 'byebug'
require_relative './board.rb'
require_relative './card.rb'

class Game

    def initialize(n)
        @board = Board.new(n)
        @prev_guessed_pos = nil
    end

    def get_user_guess
        print 'Enter two numbers separated by a space.'
        position = gets.chomp.split(' ').map(&:to_i)
    end
    
    # def board_size
    #     puts 'Enter a number for Board size'
    #     gets.chomp.to_i
    # end

    def play 

        @board.render
        @prev_guessed_pos = self.get_user_guess

        @board.reveal(@prev_guessed_pos)
        @board.render

        current_guess = self.get_user_guess
        @board.reveal(current_guess)
        @board.render
        if @board.grid[prev_guessed_pos[0]][prev_guessed_pos[1]] == @board.grid[current_guess[0]][current_guess[1]]
            puts 'Correct'
        else
            @board.grid[prev_guessed_pos[0]][prev_guessed_pos[1]].hide
            @board.grid[current_guess[0]][current_guess[1]].hide
        end

    end

end
