# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'game_io'

# Creates a game of mastermind for two players: a code maker and a code breaker
class MastermindGame
  include GameIO

  def initialize
    @game_over = false
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
  end

  def play
    display_welcome_text
    display_instructions_text

    until @game_over
      display_current_turn_text
      guess = @code_breaker.next_guess
      if guess == 'exit'
        display_game_exit_text
        @game_over = true
      else
        clues = @code_maker.get_clues(guess)
        display_next_guess_and_clues(guess, clues)
      end
    end

    display_game_over_text
  end
end
