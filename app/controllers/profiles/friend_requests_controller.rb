# frozen_string_literal: true

module Profiles
  class FriendRequestsController < ApplicationController
    before_action :authenticate_user!

    before_action :set_friend_request, only: %i[update destroy]

    def index
      @incoming = FriendRequest.where(friend: current_profile).includes(:profile)
      @outgoing = current_profile.friend_requests.includes(:profile)
    end

    def update
      @friend_request.accept_friend
      redirect_to action: :index
    end

    def destroy
      @friend_request.destroy
      redirect_to action: :index
    end

    private

    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end
  end
end
