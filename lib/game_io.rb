# frozen_string_literal: true

require 'colorize'
# Module containing game input/output utility methods
module GameIO
  def display_welcome_text
    puts <<~TEXT

      WELCOME_TEXT_PLACEHOLDER

    TEXT
  end

  def display_instructions_text
    puts <<~TEXT

      INSTRUCTIONS_TEXT_PLACEHOLDER

    TEXT
  end

  def display_current_turn_text
    puts <<~TEXT

      CURRENT_TURN_TEXT_PLACEHOLDER

    TEXT
  end

  def display_game_over_text
    puts <<~TEXT

      GAME_OVER_TEXT_PLACEHOLDER

    TEXT
  end

  def display_next_guess_text
    puts
    print "Type a 4-digit guess consisting of integers 1-6 (e.g. '1136') or enter 'exit' to exit the game: "
  end

  def display_invalid_guess_warning
    puts
    puts 'Invalid input given, please try again...'.colorize(color: :red, mode: :bold)
  end

  def next_guess
    loop do
      display_next_guess_text
      input = gets.chomp
      return input if valid_input?(input)

      display_invalid_guess_warning
    end
  end

  def valid_input?(input)
    return false unless input.length == 4
    return true if input == 'exit'

    input.split('').all? { |digit| digit.to_i.between?(1, 6) }
  end
end
