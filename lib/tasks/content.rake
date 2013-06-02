namespace :content do
  namespace :generate do
    desc "generate a large set of users"
    task :users => :environment do
      n = 7000
      puts "Creating #{n} users"
      n.times do |i|
        User.create(
          :email => "user#{i}@wiggletechsolutions.com",
          :password => "supersecure",
          :password_confirmation => "supersecure"
        )
      end
    end

    desc "generate a set of randomly-named wiggles"
    task :wiggles => :environment do
      n = 50000
      adjective_list_path = File.join(File.dirname(__FILE__), '../data/adjectives.txt')
      adjectives = File.read(adjective_list_path).split("\n")

      puts "Creating #{n} wiggles..."
      n.times do |i|
        modifiers = [adjectives.sample, adjectives.sample]
        name = "#{modifiers.join(" ")} wiggle".capitalize
        Wiggle.create(:name => name)
      end
    end

    # Power law code stolen from:
    # http://oldblog.antirez.com/post/PRNG-power-law-long-tail.html
    #
    # min and max are both inclusive
    # n is the distribution power: the higher, the more biased
    def powerlaw(min, max, n)
      max += 1
      pl = ((max**(n+1) - min**(n+1))*rand() + min**(n+1))**(1.0/(n+1))
      (max-1-pl.to_i)+min
    end

    desc "make users rate wiggles"
    task :ratings => :environment do
      ratings_per_user = 25
      puts "Giving each user #{ratings_per_user} wiggle ratings"
      all_wiggle_ids = Wiggle.all.pluck(:id)
      User.find_each do |u|
        ratings_per_user.times do
          idx = powerlaw(0, all_wiggle_ids.size-1, 2)
          wiggle = Wiggle.find(all_wiggle_ids[idx])
          puts "User #{u.id} rating wiggle #{wiggle.id}"

          # in practice, there are significantly more likes than dislikes
          if rand > 0.2
            u.like(wiggle)
          else
            u.dislike(wiggle)
          end
        end
      end
    end

    desc "generate all content needed for demo"
    task :all => [:users, :wiggles, :ratings]
  end
end