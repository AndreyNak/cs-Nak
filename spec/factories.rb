# frozen_string_literal: true

FactoryBot.define do
  factory :friend_request do
    profile { nil }
    friend { nil }
  end

  factory :mode do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }


    trait :with_servers do
      association :servers, factory: :server
    end
  end

  factory :server do
    name { 'de_dust2' }
    ip { Faker::Internet.ip_v4_address }
    count_users { rand(30) }
  end

  factory :map do
    name { 'de_dust2' }
  end
end