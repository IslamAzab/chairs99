# spec/factories/entries.rb
require 'faker'

FactoryGirl.define do
  factory :entry do
    name { Faker::Name.first_name }
    count { Faker::Number.positive }
  end
end