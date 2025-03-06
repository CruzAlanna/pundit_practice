
regular_user = User.create(name: "regular-user", email: "regular@test.com", password: "password", role: "user")

admin_user = User.create(name: "admin-user", email: "admin@test.com", password: "password", role: "admin")

i = 0
5.times do
  Product.create(name: "product ##{i}", price: i, published: true)
  i+= 1
end

i =6
5.times do
  Product.create(name: "product ##{i}", price: i, published: false)
  i += 1
end