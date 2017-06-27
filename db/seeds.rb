Pledge.destroy_all
Reward.destroy_all
User.destroy_all
Project.destroy_all
Category.destroy_all


categories = Category.create([
  { :name => 'Art' },
  { :name => 'Science' },
  { :name => 'Technology' },
  { :name => 'Music' },
  { :name => 'Film' },
  { :name => 'Television' },
  { :name => 'The Internet' },
  { :name => 'Outer Space' },
  { :name => 'Biology' },
  { :name => 'Cooking' },
  { :name => 'Food' },
  { :name => 'Automotive' },
  { :name => 'Boating' },
  { :name => 'Flying' },
  { :name => 'Sports' },
  { :name => 'Jogging' },
  { :name => 'Serious Business' },
  { :name => 'Dance' },
  { :name => 'History' },
  { :name => 'Construction' },
  { :name => 'Environment' },
  { :name => 'Medical' },
  { :name => 'Fashion' },
  { :name => 'Photography' },
  { :name => 'Logging' },
  { :name => 'Tobogganing' },
  { :name => 'Diving Tricks' },
  { :name => 'Pizza Innovation' },
  { :name => 'Life Coaching' },
  { :name => 'Creative Writing' },
  { :name => 'Typesetting' },
  { :name => 'Farming' },
  { :name => 'Travel' },
  { :name => 'Vacation' },
  { :name => 'Politics' },
  { :name => 'Haircuts' },
  { :name => 'BBQ' },
  { :name => 'Games' },
  { :name => 'Zoology' },
  { :name => 'Horseback Riding' },
  { :name => 'Soda' },
  { :name => 'Real Droids' },
  { :name => 'Renovation' },
  { :name => 'Bungee Jumping' },
  { :name => 'Ghostbusters IRL' },
  { :name => 'Pharmacy' },
  { :name => 'Candy' },
  { :name => 'VHS Restoration' },
  { :name => 'Glass Blowing' },
  { :name => 'Jewelry' },
  { :name => 'Hula Hoop Tech' },
  { :name => 'Scream Therapy' }
])

20.times do
  project = Project.create!(
              title: Faker::App.name,
              description: Faker::Lorem.paragraph,
              goal: rand(100000),
              start_date: Time.now.utc,
              end_date: Time.now.utc + rand(20).days,
              owner_id: rand(1..8)
            )

  5.times do
    project.rewards.create!(
      description: Faker::Superhero.power,
      dollar_amount: rand(100),
    )
  end
end

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )
end

20.times do
  project = Project.all.sample

  Pledge.create!(
    user: User.last,
    project: project,
    dollar_amount: project.rewards.sample.dollar_amount + rand(10)
  )
end

120.times do
  project = Project.all.sample

  project.categories << Category.all.sample #(
    #name: categories.sample.name
  #)
end
