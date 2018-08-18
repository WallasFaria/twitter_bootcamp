20.times do |i|
  User.create email: "user-numero-#{i}@email.com", password: 123456
end
