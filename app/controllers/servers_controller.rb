# frozen_string_literal: true

class ServersController < ApplicationController
  def show
    @server = current_mode.servers.find(params[:id])
  end

  private

  def current_mode
    @current_mode ||= Mode.friendly.find(params[:mode_slug])
  end
end
