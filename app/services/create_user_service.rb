# frozen_string_literal: true

class CreateUserService
  def self.call(user)
    user.update(user_role: UserRole.user.take)
    user.build_profile(nickname: 'default', place: 1)

    user
  end
end
