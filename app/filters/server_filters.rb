# frozen_string_literal: true

class ServerFilters
  class << self
    def call(scope, params)
      scope = reduce_by_maps(scope, params[:map]) if params[:map]
      scope
    end

    private

    def reduce_by_maps(scope, map)
      scope.joins(:map).where(maps: { name: map })
    end
  end
end

