require 'byebug'
require_relative './board.rb'
require_relative './card.rb'
require_relative './human_player.rb'

class Game

    def initialize
        # @board = Board.new(n)
        @prev_guessed_pos = nil
        @human_player = HumanPlayer.new

    end

    def play
        board = @human_player.board
        board.populate
        until board.won?
            system("clear")
            board.render
            @prev_guessed_pos = @human_player.get_user_guess

            board.reveal(@prev_guessed_pos)
            system("clear")
            board.render

            current_guess = @human_player.get_user_guess
            board.reveal(current_guess)
            system("clear")
            board.render
            if board.grid[@prev_guessed_pos[0]][@prev_guessed_pos[1]] == board.grid[current_guess[0]][current_guess[1]]
                puts 'Correct'
            else
                board.grid[@prev_guessed_pos[0]][@prev_guessed_pos[1]].hide
                board.grid[current_guess[0]][current_guess[1]].hide
                puts "Incorrect"
                sleep(3)
            end
        end
        puts "Great Job!"
    end

end

g = Game.new
g.play