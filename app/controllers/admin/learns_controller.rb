# frozen_string_literal: true

module Admin
  class LearnsController < BaseController
    def index
      authorize Learn

      @learns = Learn.all.order(created_at: :desc)
    end

    def show
      authorize Learn

      @learn = Learn.find(params[:id])
    end

    def new
      authorize Learn

      @learn = Learn.new
    end

    def edit
      authorize Learn

      @learn = Learn.find(params[:id])
    end

    def create
      authorize Learn

      @learn = Learn.new(learn_params)
      if @learn.save
        redirect_to admin_learn_path(@learn.id)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize Learn

      @learn = Learn.find(params[:id])

      if @learn.update(learn_params)
        redirect_to admin_learn_path(@learn.id)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def learn_params
      params[:learn].permit(:title, :content)
    end
  end
end
