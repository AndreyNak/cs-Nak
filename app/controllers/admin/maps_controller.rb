# frozen_string_literal: true

module Admin
  class MapsController < BaseController
    def index
      authorize Map

      @maps = Map.all
    end

    def show
      authorize Map

      @map = Map.find(params[:id])
    end

    def new
      authorize Map

      @map = Map.new
    end

    def edit
      authorize Map

      @map = Map.find(params[:id])
    end

    def create
      authorize Map

      @map = Map.new(maps_params)
      if @map.save
        redirect_to admin_maps_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize Map

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
