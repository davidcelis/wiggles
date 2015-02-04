require 'set'

class PasswordCharacters
  def initialize(characters)
    @characters = Set.new(characters)
  end

  def allowed?(password)
    password.split("").all? do |c|
      @characters.include?(c)
    end
  end
end
