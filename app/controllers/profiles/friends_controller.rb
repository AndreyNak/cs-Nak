# frozen_string_literal: true

module Profiles
  class FriendsController < ApplicationController
    before_action :authenticate_user!

    def index
      @friends = profile.friends
    end

    def destroy
      authorize friend, :unfriend?

      current_profile.remove_friend(friend)
      redirect_to action: :index
    end

    private

    def friend
      @friend ||= profile.friends.find(params[:id])
    end

    def profile
      @profile ||= Profile.find(params[:profile_id])
    end
  end
end
