# frozen_string_literal: true

require_relative 'game_io'
# Creates a code breaker responsible for guessing the secret code every turn
class CodeBreaker
  include GameIO

  def initialize(human_role)
    @human_role = human_role
  end

  def next_guess
    run_human_next_guess if @human_role
    run_cpu_next_guess unless @human_role
  end

  private

  def valid_input?(input)
    return false unless input.length == 4
    return true if input == 'exit'

    input.split('').all? { |digit| digit.to_i.between?(1, 6) }
  end

  def run_cpu_next_guess
    sleep(1)
    next_guess = []
    4.times { next_guess.push([1, 2, 3, 4, 5, 6].sample) }
    next_guess.join
  end

  def run_human_next_guess
    loop do
      display_next_guess_text
      input = gets.chomp.downcase
      return input if valid_input?(input)

      display_invalid_input_warning
    end
  end
end
