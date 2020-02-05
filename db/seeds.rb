News.destroy_all
100.times do
  News.create(title: Faker::Lorem.sentence,description: Faker::Lorem.paragraph)
end

User.destroy_all
50.times do
  User.create(name: Faker::Name.name,email: Faker::Internet.email,phone:Faker::PhoneNumber.cell_phone,password: "123456789",password_confirmation: "123456789")
end