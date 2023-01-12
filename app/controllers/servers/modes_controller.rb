# frozen_string_literal: true

module Servers
  class ModesController < ApplicationController
    def index
      @modes = Mode.all
    end

    def show
      @mode = Mode.friendly.find(params[:id])
    end
  end
end