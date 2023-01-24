# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout -> { turbo_frame_request? ? false : 'admin' }

    before_action :authorization

    def authorization
      redirect_to '/' unless current_user
    end
  end
end
