# frozen_string_literal: true

class CreateUserService
  def self.call(user)
    user.update(user_role: UserRole.find_by(name: 'user'))
    user.build_profile(nickname: 'default', place: 1)

    user.profile.avatar.attach(io: File.open('app/assets/images/avatar.png'), filename: 'avatar.png')

    user
  end
end
