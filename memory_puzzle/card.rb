require 'byebug'

class Card

    attr_reader :value

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

    # def to_s

    # end

    def ==(other_card)
        self.value == other_card.value
    end

end