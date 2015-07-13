require 'responders'

module Responders
  module PaginationResponder
    def respond
      if paginated?
        controller.headers.merge! "Pagination-Limit" => resource.limit_value.to_s, 
                                  "Pagination-Offset" => resource.offset_value.to_s,
                                  "Pagination-Count" => resource.total_count.to_s
      end
      super
    end

    private

    def paginated?
      resource.respond_to?(:limit_value) &&
      resource.respond_to?(:offset_value) &&
      resource.respond_to?(:total_count)
    end
  end
end
