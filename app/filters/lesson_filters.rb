# frozen_string_literal: true

class LessonFilters
  class << self
    def call(scope, params)
      scope = reduce_by_search(scope, params[:search]) if params[:search]
      scope
    end

    private

    def reduce_by_search(scope, search)
      scope.where('lessons.title ILIKE :like', like: "%#{search}%")
    end
  end
end
