User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
	     admin:true,
	     activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
	       activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
200.times do
  name = Faker::Lorem.word
  category = Faker::Lorem.sentence(1)
  price = Faker::Number.decimal(5)
  quantity = rand(52..112)
  discount = Faker::Number.decimal(5)
  users.each { |user| user.products.create!(name: name, category: category, price: price, quantity: quantity, discount: discount) }
end
