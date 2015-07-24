require 'responders'

module Responders
  module PaginationResponder
    def respond
      if paginated?
        controller.headers.merge! "Pagination-Limit" => resource.limit_value.to_s, 
                                  "Pagination-Offset" => resource.offset_value.to_s,
                                  "Pagination-Count" => resource.total_count.to_s,
                                  "Pagination-Next" => next_page,
                                  "Pagination-Prev" => prev_page
      end
      super
    end

    delegate :url_for, to: :controller
    delegate :params, to: :request

    private

    def paginated?
      resource.respond_to?(:limit_value) &&
      resource.respond_to?(:offset_value) &&
      resource.respond_to?(:total_count)
    end

    def next_page
      puts "next_page started"
      url_for params.merge(page: resource.next_page) unless resource.last_page?
      puts "next_page ended"
    end

    def prev_page
      puts "prev_page started"
      url_for params.merge(page: resource.prev_page) unless resource.first_page?
      puts "prev_page ended"
    end
  end
end
