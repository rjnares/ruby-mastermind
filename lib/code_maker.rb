# frozen_string_literal: true

require_relative 'code'
require_relative 'game_io'

# Creates a code maker responsible for creating a secret code and giving feedback after every guess
class CodeMaker
  include GameIO

  def initialize(human_role)
    @human_role = human_role
    @secret_code = create_new_secret_code
  end

  def get_clues(guess)
    guessed_code = Code.new(string_to_num_array(guess))
    @secret_code.create_clues_from(guessed_code)
  end

  def secret_code_as_string
    @secret_code.to_s
  end

  private

  def create_new_secret_code
    return human_create_new_secret_code if @human_role

    cpu_create_new_secret_code
  end

  def cpu_create_new_secret_code
    random_num_array = Array.new(4) { [1, 2, 3, 4, 5, 6].sample }
    Code.new(random_num_array)
  end

  def human_create_new_secret_code
    loop do
      display_create_secret_code_text
      input = gets.chomp.downcase
      return Code.new(string_to_num_array(input)) if valid_input?(input)

      display_invalid_input_warning
    end
  end

  def valid_input?(input)
    return false unless input.length == 4

    input.split('').all? { |digit| digit.to_i.between?(1, 6) }
  end

  def string_to_num_array(string)
    string.split('').map(&:to_i)
  end
end
