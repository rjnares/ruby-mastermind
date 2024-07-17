# frozen_string_literal: true

require_relative 'code_maker'
require_relative 'code_breaker'

# Creates a game of mastermind for two players: a code maker and a code breaker
class MastermindGame
  def initialize
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
  end
end
