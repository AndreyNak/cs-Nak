# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout -> { turbo_frame_request? ? false : 'admin' }
  end
end
