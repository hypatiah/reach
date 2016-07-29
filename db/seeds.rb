10.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password: Faker::Internet.password(6, 10))
end

15.times do
    Reach.create(user_id: rand(1..10), contact_name: Faker::Name.name, contact_phone: Faker::PhoneNumber.phone_number, text: Faker::Lorem.paragraph(2), label: Faker::Team.creature, main_reach: Faker::Boolean.boolean)
end
