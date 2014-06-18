Fabricator(:user) do
  name { Faker::Name.name }
  password { "testtest" }
  password_confirmation { |attrs| attrs[:password] }
  blurb { Faker::Lorem.paragraph }
  location { Faker::Address.postcode }
  phone { Faker::PhoneNumber.phone_number }
  email { |attrs| "#{attrs[:name].parameterize}@example.com" }
end