# Seed data

user1 = User.create!(
  email: "test1@example.com", password: "test123",
  password_confirmation: "test123"
)
user2 = User.create!(
  email: "test2@example.com", password: "test123",
  password_confirmation: "test123", referred_by_id: user1.id
)
user1.referrals.create!(email: "test@referral.com")

puts "User created"
