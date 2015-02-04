require 'forwardable'
require 'set'

class PasswordCharacters
  extend Forwardable

  def_delegator :@characters, :include?

  def initialize(characters)
    @characters = Set.new(characters)
  end

  def allowed?(password)
    password.split("").all? do |c|
      self.include?(c)
    end
  end
end
