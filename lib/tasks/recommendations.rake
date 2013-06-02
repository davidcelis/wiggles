namespace :recommendations do
  desc "update recommendations and similarities for all users"
  task :update => :environment do
    count = User.count
    idx = 0
    redis = Recommendable.config.redis
    max = 1024 * 1024 * 1024 * 1.5
    User.all.offset(2739).find_each do |user|
      redis_used_memory = redis.info['used_memory_rss'].to_i
      sleep 0.01
      exit if redis_used_memory > max
      puts "#{idx} / #{count} - redis @ #{redis_used_memory}"
      Recommendable::Helpers::Calculations.update_similarities_for(user.id)
      Recommendable::Helpers::Calculations.update_recommendations_for(user.id)
      idx += 1
    end
  end
end
