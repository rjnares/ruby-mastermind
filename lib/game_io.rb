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

  def display_role_select_text
    puts
    print "Type '1' to play as the code maker or '2' to play as the code breaker: "
  end

  def user_role
    loop do
      display_role_select_text
      role = gets.chomp.downcase
      return role if %w[1 2 exit].include?(role)

      display_invalid_input_warning
    end
  end

  def display_example
    puts <<~TEXT


      The code maker will choose 4 of these options to create a #{'secret code'.underline}. For example:

    TEXT

    print_guess('1136')

    puts <<~TEXT


      As you can see, there can be #{'more than one'.underline} of the same option in a single code.
      In order to win, the code breaker must guess the secret code in 12 turns or less.
      After each guess, the code breaker will be given a set of up to 4 red or white clues:

       #{RED_CLUE} A red clue means you have placed a correct option in the correct location
       #{WHITE_CLUE} A white clue means you have placed a correct option in the wrong location

      To continue the above example, using the secret code '1136', a guess of '1326' would yield these clues:

       #{RED_CLUE} A red clue because the '1' is in the correct location
       #{RED_CLUE} A red clue because the '6' is in the correct location
       #{WHITE_CLUE} A white clue because the '3' is in the wrong location

    TEXT
  end

  def display_welcome_and_instructions_text
    puts <<~TEXT

      #{'WELCOME TO MY MASTERMIND GAME BUILT WITH RUBY!'.colorize(mode: :bold)}

      This is a 1-player game against the cpu where you can play as the #{'code maker'.underline} or #{'code breaker'.underline}.
      There are 6 different options to choose from when creating a code:

    TEXT

    print_guess('123456')

    display_example

    puts "Enough talking, let's play!"
  end

  def display_current_turn_text(turn)
    puts
    puts "TURN #{turn}".colorize(mode: :bold)
  end

  def display_game_lose_text(secret_code)
    puts
    puts 'Your 12 turns are up! Game over, you lose!'
    print 'Here is the code you were trying to break:'
    print_guess(secret_code)
    puts
    puts
  end

  def display_next_guess_text
    puts
    print "Type a 4-digit guess consisting of integers 1-6 (e.g. '1136') or enter 'exit' to exit the game: "
  end

  def display_create_secret_code_text
    puts
    print "Type a 4-digit secret code consisting of integers 1-6 (e.g. '1136'): "
  end

  def display_invalid_input_warning
    puts
    puts 'Invalid input given, please try again...'.colorize(color: :red, mode: :bold)
  end

  def display_game_exit_text
    puts <<~TEXT

      Exiting game...thank you for playing!

    TEXT
  end

  def display_game_win_text
    puts <<~TEXT

      You broke the code! Game over, you win!

    TEXT
  end

  def display_next_guess_and_clues(guess, clues)
    puts
    print 'Guessed code: '
    print_guess(guess)
    print '  Clues: '
    print_clues(clues)
    puts
  end

  def print_guess(guess)
    guess.split('').each do |digit|
      colored_digit = " #{digit} ".colorize(background: DIGIT_TO_BG_COLOR_MAP[digit])
      print " #{colored_digit} "
    end
  end

  def print_clues(clues)
    clues.each do |clue|
      clue_to_print = clue ? RED_CLUE : WHITE_CLUE
      print " #{clue_to_print} "
    end
  end
end
