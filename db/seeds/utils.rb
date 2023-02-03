# frozen_string_literal: true

require_relative 'data'

def generate_lessons
  lessons_data.each do |params|
    Lesson.create(params)
  end
end

def generate_users
  default_user_password = 'Password123??'

  admin = UserRole.create(name: 'admin')
  user = UserRole.create(name: 'user')

  data = [
    {
      emain: 'email.admin@gmail.com',
      user_role: admin,
      password: default_user_password,
      password_confirmation: default_user_password
    },
    {
      emain: 'email.user@gmail.com',
      user_role: user,
      password: default_user_password,
      password_confirmation: default_user_password
    }
  ]

  data.each_with_index do |params, index|
    user = User.new(params)

    user.create_profile(nickname: Faker::Name.middle_name, place: index + 1)
    user.save
  end
end
