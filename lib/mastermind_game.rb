# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'game_io'

# Creates a game of mastermind for two players: a code maker and a code breaker
class MastermindGame
  include GameIO

  def initialize
    @turn = 1
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new

    display_welcome_and_instructions_text
  end

  def play
    while @turn.between?(1, 12)
      display_current_turn_text(@turn)
      guess = @code_breaker.next_guess

      if guess == 'exit'
        display_game_exit_text
        return
      end

      clues = @code_maker.get_clues(guess)
      display_next_guess_and_clues(guess, clues)

      if clues.length == 4 && clues.all?
        display_game_win_text
        return
      end

      @turn += 1
    end

    display_game_lose_text(@code_maker.secret_code_as_string)
  end
end
