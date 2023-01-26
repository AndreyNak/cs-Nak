# frozen_string_literal: true

class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.order(created_at: :desc)
    @lessons = LessonFilters.call(@lessons, params)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
