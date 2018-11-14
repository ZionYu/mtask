namespace :dev do
  task fake: :environment do
    Task.destroy_all

    100.times do |i|
      Task.create!(
        title: FFaker::BaconIpsum.word,
        content: FFaker::HipsterIpsum.phrase,
        created_at:Time.now - rand(0..10000) - rand(1..10).days,
        deadline: Time.now + rand(0..10000) + rand(1..100).days,
        state: rand(0..2),
        priority: rand(0..2)
      )
    end
  end 
end