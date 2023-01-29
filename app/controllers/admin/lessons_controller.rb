# frozen_string_literal: true

module Admin
  class LessonsController < BaseController
    def index
      authorize Lesson

      @lessons = Lesson.all.order(created_at: :desc)
    end

    def show
      authorize Lesson

      render locals: { lesson: resource_lesson }
    end

    def new
      authorize Lesson

      @lesson = Lesson.new
    end

    def edit
      authorize Lesson

      render locals: { lesson: resource_lesson }
    end

    def create
      authorize Lesson

      @lesson = Lesson.new(lesson_params)
      if @lesson.save
        redirect_to admin_lesson_path(@lesson.id)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize Lesson

      if resource_lesson.update(lesson_params)
        redirect_to admin_lesson_path(resource_lesson.id)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def lesson_params
      params[:lesson].permit(:title, :content)
    end

    def resource_lesson
      @resource_lesson ||= Lesson.find(params[:id])
    end
  end
end
