# frozen_string_literal: true

class LearnsController < ApplicationController
  def index
    @learns = Learn.all.order(created_at: :desc)
    @learns = LearnFilters.call(@learns, params)
  end

  def show
    @learn = Learn.find(params[:id])
  end
end
