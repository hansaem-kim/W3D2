require 'byebug'

class Card

    attr_reader :value, :face_up

    def initialize(value) 
        @value = value
        @face_up = false
    end

    def hide
        @face_up = false 
    end

    def reveal 
        @face_up = true
    end

    def display
        return @value if @face_up
    end

    # def to_s

    # end

    def ==(other_card)
        self.value == other_card.value
    end

end