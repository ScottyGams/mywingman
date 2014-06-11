Fabricator(:user) do
  name { Faker::Name.first_name }
  password { "testtest" }
  password_confirmation { |attrs| attrs[:password] }
  location { Faker::Address.city }
  phone { (rand(900) + 100).to_s + "-" + (rand(9000) + 1000).to_s + "-" + (rand(9000) + 1000).to_s }
  email { Faker::Internet.email }
end