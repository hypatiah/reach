require 'faker'
10.times do
    User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password(6, 10))
end

15.times do
    Text.create(user_id: rand(1..10), description: Faker::Lorem.paragraph(2))
end

15.times do
    Contact.create(user_id: rand(1..10), name: Faker::Name.name, phone: Faker::PhoneNumber.phone_number, relationship: Faker::Team.creature)
end

15.times do
    Reach.create(user_id: rand(1..10), text_id: rand(1..15), contact_id: rand(1..15))
end
