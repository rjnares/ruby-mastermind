# frozen_string_literal: true

# Creates a mastermind game code consisting of four values
class Code
  def initialize(num_array)
    @num_array = num_array
  end

  def create_clues_from(other_code)
    secret_code_num_frequency = create_secret_code_num_frequency_map
    exact_match_clues = create_exact_match_clues(other_code, secret_code_num_frequency)
    partial_match_clues = create_partial_match_clues(other_code, secret_code_num_frequency)
    exact_match_clues + partial_match_clues
  end

  protected

  attr_reader :num_array

  private

  def create_partial_match_clues(other_code, secret_code_num_frequency)
    other_code.num_array.each_with_object([]).with_index do |(digit, clues), index|
      if digit != @num_array[index] && secret_code_num_frequency[digit].positive?
        clues.push(false)
        secret_code_num_frequency[digit] -= 1
      end
    end
  end

  def create_exact_match_clues(other_code, secret_code_num_frequency)
    other_code.num_array.each_with_object([]).with_index do |(digit, clues), index|
      if digit == @num_array[index]
        clues.push(true)
        secret_code_num_frequency[digit] -= 1
      end
    end
  end

  def create_secret_code_num_frequency_map
    @num_array.each_with_object(Hash.new(0)) { |digit, hash| hash[digit] += 1 }
  end
end
