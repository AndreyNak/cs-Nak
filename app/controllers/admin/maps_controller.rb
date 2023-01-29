# frozen_string_literal: true

module Admin
  class MapsController < BaseController
    def index
      authorize Map

      @maps = Map.includes([main_image_attachment: :blob]).all
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
        redirect_to action: :show
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize Map

      @map = Map.find(params[:id])

      if @map.update(maps_params)
        redirect_to action: :show
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def maps_params
      params[:map].permit(:name, :main_image)
    end
  end
end
