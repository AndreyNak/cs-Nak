# frozen_string_literal: true

module Admin
  class MapsController < BaseController
    layout "admin"

    def index
      @maps = Map.all
    end

    def show
      @map = Map.find(params[:id])
    end

    def new
      @map = Map.new
    end

    def create
      @map = Map.new(maps_params)
      if @map.save
        redirect_to admin_maps_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @map = Map.find(params[:id])
    end

    def update
      @map = Map.find(params[:id])

      if @map.update(maps_params)
        redirect_to admin_maps_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def maps_params
      params[:map].permit(:name, :image)
    end
  end
end
