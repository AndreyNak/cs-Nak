# frozen_string_literal: true

module ProfileHelper
  def profile_tab(params)
    return 'profile' if params[:controller] == 'profiles'
    return 'friends' if params[:controller] == 'profiles/friends'
  end
end
