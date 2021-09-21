# == Schema Information
#
# Table name: venues
#
#  id                :uuid             not null, primary key
#  name              :string           not null
#  short_description :text             not null
#  long_description  :text             not null
#  address           :text             not null
#  lat               :decimal(8, 6)    not null
#  lng               :decimal(9, 6)    not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :venue do
    name { Faker::Lorem.paragraph_by_chars(number: 25) }
    short_description { Faker::Lorem.paragraph_by_chars(number: 50) }
    long_description { Faker::Lorem.paragraph_by_chars(number: 500) }
    address { Faker::Lorem.paragraph_by_chars(number: 50) }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }

    trait :with_short_desc_of_51chars do
      short_description { Faker::Lorem.paragraph_by_chars(number: 51) }
    end

    trait :with_long_desc_of_501chars do
      long_description { Faker::Lorem.paragraph_by_chars(number: 501) }
    end

    trait :with_address_of_51chars do
      address { Faker::Lorem.paragraph_by_chars(number: 51) }
    end
  end
end
