Fabricator(:user) do
  name { Faker::Name.first_name }
  password { "testtest" }
  password_confirmation { |attrs| attrs[:password] }
  location { Faker::Address.city }
  phone { Faker::PhoneNumber.phone_number }
  email { Faker::Internet.email }
end