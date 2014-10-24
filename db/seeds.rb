require 'faker'

5.times do
  user = User.new(
      name: Faker::Name.name,
      email:Faker::Internet.email,
      password: Faker::Lorem.characters(10)
  )
 # user.skip_confirmation! # since confirmation emails are turned off
  user.save!

end

me = User.new(
    name:     'Davey',
    email:    'dwilbank@gmail.com',
    password: '1aberath'
)
#me.skip_confirmation! # since confirmation emails are turned off
me.save!

boss = User.new(
    name:     'Boss',
    email:    'dwilbank2@gmail.com',
    password: '1aberath2',
    role:     'admin'
)
#boss.skip_confirmation! # since confirmation emails are turned off
boss.save!

users = User.all

50.times do
  Wiki.create(
      name: Faker::Lorem.word,
      body: Faker::Lorem.paragraph(sentence_count = 3),
      user: users.sample
  )
end
wikis = Wiki.all


puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
