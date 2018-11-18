namespace :dev do

  task fake_user: :environment do
    10.times do |i|
      User.create!(
        name: FFaker::Name.first_name,
        email: FFaker::Internet.safe_email,
        password: "12345678"  
      )
    end
    puts "have created #{User.count} fake users"
  end

  task fake_task: :environment do
    Task.destroy_all
    User.all.each do |user|
      15.times do |i|
        tag_list = ["exercise", "learn", "travel", "skill", "urgent"]
        Task.create!(
          title: FFaker::BaconIpsum.word,
          content: FFaker::HipsterIpsum.phrase,
          created_at:Time.now - rand(0..10000) - rand(1..10).days,
          deadline: Time.now + rand(0..10000) + rand(1..100).days,
          state: rand(0..2),
          priority: rand(0..2),
          user_id: User.ids.sample,
          tag_list: tag_list.sample(rand(1..3))
        )
      end
    end
  end 

  task fake_all: :environment do
    Rake::Task['dev:fake_user'].execute
    Rake::Task['dev:fake_task'].execute
  end
  
end