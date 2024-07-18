# frozen_string_literal: true

# Creates a mastermind game code consisting of four values
class Code
  def initialize(num_array)
    @num_array = num_array
  end

  def create_clues_from(other_code)
    secret_code_num_frequency = @num_array.each_with_object(Hash.new(0)) { |digit, hash| hash[digit] += 1 }
    other_code.num_array.each_with_object([]).each_with_index do |(digit, clues), index|
      if digit == @num_array[index]
        clues.prepend(true)
        secret_code_num_frequency[digit] -= 1
      elsif secret_code_num_frequency[digit].positive?
        clues.push(false)
        secret_code_num_frequency[digit] -= 1
      end
    end
  end

  protected

  attr_reader :num_array
end
