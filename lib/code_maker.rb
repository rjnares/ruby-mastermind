# frozen_string_literal: true

require_relative 'code'

# Creates a code maker responsible for creating a secret code and giving feedback after every guess
class CodeMaker
  def initialize
    @secret_code = Code.new(generate_random_num_array)
  end

  def get_clues(guess)
    guessed_code = Code.new(string_to_num_array(guess))
    @secret_code.create_clues_from(guessed_code)
  end

  private

  def generate_random_num_array
    Array.new(4) { [1, 2, 3, 4, 5, 6].sample }
  end

  def string_to_num_array(string)
    string.split('').map(&:to_i)
  end
end
