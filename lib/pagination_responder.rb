require 'responders'

module Responders
  module PaginationResponder
    def respond
      controller.headers.merge! pagination_headers if paginated?
      super
    end

    delegate :url_for, to: :controller
    delegate :params, to: :request

    private

    def pagination_headers
      { 
        "Pagination-Limit"  => resource.limit_value.to_s, 
        "Pagination-Offset" => resource.offset_value.to_s,
        "Pagination-Count"  => resource.total_count.to_s,
        "Pagination-Next"   => next_page.to_s,
        "Pagination-Prev"   => prev_page.to_s 
      }
    end    

    def paginated?
      resource.respond_to?(:limit_value) &&
      resource.respond_to?(:offset_value) &&
      resource.respond_to?(:total_count)
    end

    def next_page
      url_for params.merge(page: resource.next_page) unless resource.last_page?
    end

    def prev_page
      url_for params.merge(page: resource.prev_page) unless resource.first_page?
    end
  end
end
