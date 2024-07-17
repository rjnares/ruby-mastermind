# frozen_string_literal: true

require_relative 'code'

# Creates a code maker responsible for creating a secret code and giving feedback after every guess
class CodeMaker
  def initialize
    puts 'I am the code maker!'
    @secret_code = Code.new
  end
end
