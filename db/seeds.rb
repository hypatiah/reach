10.times do
    User.new(username: Faker::Internet.user_name, email: Faker::Internet.email, password_hash: Faker::Internet.password(6, 10))
end

15.times do
    Reach.create(user_id: rand(1..10), contact_name: Faker::Name.name, contact_phone: Faker::PhoneNumber.phone_number, text: Faker::Lorem.paragraph(2), label: Faker::Team.creature, main_reach: Faker::Boolean.boolean)
end
