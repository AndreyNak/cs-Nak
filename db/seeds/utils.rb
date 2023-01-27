# frozen_string_literal: true

require_relative 'data'

def generate_lessons
  lessons_data.each do |params|
    Lesson.create(params)
  end
end

def generate_user
  default_user_password = 'Password123??'

  role = UserRole.create(name: 'admin')

  user = User.new(
    emain: 'email.admin@gmail.com',
    user_role: role,
    password: default_user_password,
    password_confirmation: default_user_password
  )

  user.create_profile(nickname: 'Null', place: 1)
  user.save
end
