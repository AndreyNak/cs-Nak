# frozen_string_literal: true

module Servers
  class ModesController < ApplicationController
    def index
      @modes = Mode.all
    end

    def show
      mode = Mode.friendly.find(params[:id])

      servers = ServerFilters.call(mode.servers, params)
      render locals: {
        mode:,
        maps: Map.all,
        servers:
      }
    end
  end
end