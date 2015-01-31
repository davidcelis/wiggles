# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

n = 50000

adjective_list_path = File.join(File.dirname(__FILE__), 'adjectives.txt')
adjectives = File.read(adjective_list_path).split("\n")

puts "Creating #{n} wiggles..."
n.times do |i|
  modifiers = [adjectives.sample, adjectives.sample]
  name = "#{modifiers.join(" ")} wiggle".capitalize
  Wiggle.create(:name => name)
end
