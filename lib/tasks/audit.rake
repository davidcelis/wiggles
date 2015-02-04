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

  task :passwords_benchmark => :environment do
    require 'benchmark'

    characters = PasswordCharacters.new(User::PASSWORD_CHARACTERS)

    Benchmark.bm do |x|
      x.report("password_audit") do
        User.all.each do |user|
          characters.allowed?(user.password)
        end
      end
    end
  end
end
