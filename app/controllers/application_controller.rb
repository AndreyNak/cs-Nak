# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  after_action :update_user_online, if: :user_signed_in?

  helper_method :current_profile

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: ->(e) { server_error(e) }
    rescue_from Pundit::NotAuthorizedError, with: ->(e) { not_found(e) }
    rescue_from ActiveRecord::RecordNotFound, with: ->(e) { not_found(e) }
    rescue_from ActionController::RoutingError, with: ->(e) { not_found(e) }
  end

  private

  def not_found(exeption)
    render_error('404', exeption)
  end

  def server_error(exeption)
    render_error('500', exeption)
  end

  def render_error(status, exeption)
    Rails.logger.warn 'EXEPTION!' * 10 # imagine that this is Appsignal
    Rails.logger.warn exeption
    Rails.logger.warn 'EXEPTION!' * 10
    render template: "errors/#{status}", layout: 'application', status:
  end

  def current_profile
    current_user.profile
  end

  def update_user_online
    current_user.try :touch
  end
end
