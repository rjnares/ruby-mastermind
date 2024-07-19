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

      return if early_exit?(guess)

      clues = @code_maker.get_clues(guess)
      display_next_guess_and_clues(guess, clues)

      return if game_win?(clues)

      @turn += 1
    end

    display_game_lose_text(@code_maker.secret_code_as_string)
  end

  private

  def early_exit?(input)
    early_exit = input == 'exit'
    display_game_exit_text if early_exit
    early_exit
  end

  def game_win?(clues)
    game_win = clues.length == 4 && clues.all?
    display_game_win_text if game_win
    game_win
  end
end
