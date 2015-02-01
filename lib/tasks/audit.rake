namespace :audit do
  desc 'Audit users with passwords that do not match new policies'
  task :passwords => :environment do
    characters = PasswordCharacters.new(User::PASSWORD_CHARACTERS)

    User.all.each do |user|
      unless characters.allowed?(user.password)
        puts "User #{user.id} (#{user.username}) has bad password: #{user.password}"
      end
    end
  end
end
