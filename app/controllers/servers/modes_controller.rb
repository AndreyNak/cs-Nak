# frozen_string_literal: true

module Servers
  class ModesController < ApplicationController
    def index
      @modes = Mode.all
    end

    def show
      mode = Mode.friendly.find(params[:slug])
      modes = Mode.order(:name)
      maps = Map.all
      servers = ServerFilters.call(mode.servers, params)
      render locals: {
        mode:,
        maps:,
        servers:,
        modes:
      }
    end
  end
end
