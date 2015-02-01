class User < ActiveRecord::Base
  LOWERCASE_LETTERS = ('a'..'z').to_a
  UPPERCASE_LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a
  PASSWORD_CHARACTERS = LOWERCASE_LETTERS + UPPERCASE_LETTERS + NUMBERS
end
