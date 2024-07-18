# frozen_string_literal: true

require_relative 'game_io'
# Creates a code breaker responsible for guessing the secret code every turn
class CodeBreaker
  include GameIO

  def initialize
    puts 'I am the code breaker!'
  end

  def next_guess
    loop do
      display_next_guess_text
      input = gets.chomp.downcase
      return input if valid_input?(input)

      display_invalid_guess_warning
    end
  end

  private

  def valid_input?(input)
    return false unless input.length == 4
    return true if input == 'exit'

    input.split('').all? { |digit| digit.to_i.between?(1, 6) }
  end
end
