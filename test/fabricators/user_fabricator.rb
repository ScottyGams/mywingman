Fabricator(:user) do
  name { Faker::Name.first_name }
  password { "testtest" }
  password_confirmation { |attrs| attrs[:password] }
  blurb { Faker::Lorem.paragraph }
  location { Faker::Address.postcode }
  phone { Faker::PhoneNumber.phone_number }
  email { Faker::Internet.email }
end