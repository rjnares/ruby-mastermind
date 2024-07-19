# frozen_string_literal: true

require 'colorize'
# Module containing game input/output utility methods
module GameIO
  DIGIT_TO_BG_COLOR_MAP = {
    '1' => :red,
    '2' => :green,
    '3' => :yellow,
    '4' => :blue,
    '5' => :magenta,
    '6' => :cyan
  }.freeze

  RED_CLUE = "\u25CF".encode.colorize(:red)
  WHITE_CLUE = "\u25CF".encode.colorize(:white)

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

  def display_game_exit_text
    puts <<~TEXT

      Exiting game...thank you for playing!

    TEXT
  end

  def display_next_guess_and_clues(guess, clues)
    puts
    print 'Guessed code: '
    print_guess(guess)
    print '  Clues: '
    print_clues(clues)
  end

  def print_guess(guess)
    guess.split('').each do |digit|
      print "  #{digit}  ".colorize(background: DIGIT_TO_BG_COLOR_MAP[digit])
    end
  end

  def print_clues(clues)
    clues.each do |clue|
      clue_to_print = clue ? RED_CLUE : WHITE_CLUE
      print " #{clue_to_print} "
    end
  end
end
