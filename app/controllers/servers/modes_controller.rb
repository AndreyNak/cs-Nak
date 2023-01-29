# frozen_string_literal: true

module Servers
  class ModesController < ApplicationController
    def index
      @modes = modes_collection
    end

    def show
      modes = modes_collection.order(:name)
      mode = modes.friendly.find(params[:slug])
      maps = Map.all
      servers = ServerFilters.call(mode.servers, params).includes(map: [main_image_attachment: :blob])
      render locals: {
        mode:,
        maps:,
        servers:,
        modes:
      }
    end

    def modes_collection
      @modes_collection = Mode.all
    end
  end
end
