

namespace :db do
  desc "TODO"
  task populate: :environment do
    
    10.times do
      @post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(5))
    end
  end
  puts "Done"
end
