# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all_without(current_profile)
  end

  def show
    render locals: { profile: resource_profile }
  end

  def edit
    authorize resource_profile

    render locals: { profile: resource_profile }
  end

  def friendship
    authorize resource_profile

    @friend_request = current_profile.friend_requests.new(friend: resource_profile)
    if @friend_request.save
      redirect_to profile_find_friens_url(current_profile.id)
    else
      render json: @friend_request.errors, status: :unprocessable_entity
    end
  end

  private

  def resource_profile
    @resource_profile ||= Profile.find(params[:id])
  end
end
