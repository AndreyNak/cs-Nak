# frozen_string_literal: true

FactoryBot.define do
  factory :mode do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }

    trait :with_servers do
      association :servers, factory: :server
    end
  end

  factory :user_role do
    name { 'user' }
  end

  factory :user do
    email { Faker::Internet.email }
    password { 'Password123??' }
    password_confirmation { 'Password123??' }
    user_role
  end

  factory :profile do
    user
    nickname { Faker::Name.middle_name }
    place { 1 }
  end

  factory :friend_request do
    profile
    friend { profile }
  end

  factory :server do
    name { 'de_dust2' }
    ip { Faker::Internet.ip_v4_address }
    count_users { rand(30) }
  end

  factory :map do
    name { 'de_dust2' }
  end

  factory :lesson do
    title { Faker::Name.name }
    content { "<p> #{Faker::Lorem.paragraph}</p>" }
  end
end
