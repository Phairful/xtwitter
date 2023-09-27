require 'faker'

FactoryBot.define do
  factory :user do
    username {Faker::Internet.username(specifier: 5..19)} # Generate unique usernames
    display_name { Faker::Internet.username(specifier: 3..19) } # Generate unique display names
    email { Faker::Internet.email(domain: 'test')} # Generate unique email addresses
    password { 'Passworasddsd123!@' } # Had to set a default password since it should comply with the format
    bio {}
  end
end
