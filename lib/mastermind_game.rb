# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'game_io'

# Creates a game of mastermind for two players: a code maker and a code breaker
class MastermindGame
  include GameIO

  def initialize
    @turn = 1
    @game_over = false
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
  end

  def play
    display_welcome_and_instructions_text

    until @game_over
      display_current_turn_text(@turn)
      guess = @code_breaker.next_guess

      if guess == 'exit'
        display_game_exit_text
        @game_over = true
        next
      end

      clues = @code_maker.get_clues(guess)
      display_next_guess_and_clues(guess, clues)

      if clues.length == 4 && clues.all?
        display_game_win_text
        @game_over = true
      end

      @turn += 1

      if @turn > 12
        display_game_lose_text(@code_maker.secret_code_as_string)
        @game_over = true
      end
    end
  end
end
