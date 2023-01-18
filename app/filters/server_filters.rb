# frozen_string_literal: true

class ServerFilters
  class << self
    def call(scope, params)
      scope = reduce_by_search(scope, params[:search]) if params[:search]
      scope = reduce_by_maps(scope, params[:map]) if params[:map]
      scope = reduce_by_count_users(scope, params[:free])
      reduce_by_prime(scope, params[:prime])
    end

    private

    def reduce_by_search(scope, search)
      scope.where('servers.name ILIKE :like', like: "%#{search}%")
    end

    def reduce_by_prime(scope, prime)
      prime = to_bool(prime)

      scope.where(prime:)
    end

    def reduce_by_maps(scope, map)
      scope.joins(:map).where(maps: { name: map })
    end

    def reduce_by_count_users(scope, free)
      free = to_bool(free)

      return scope.where(Server.arel_table[:count_users].lt(Server::FULL_COUNT_SERVER)) if free

      scope.where(count_users: Server::FULL_COUNT_SERVER)
    end

    def to_bool(value)
      value = !value if value.nil?

      ActiveRecord::Type::Boolean.new.cast(value)
    end
  end
end
