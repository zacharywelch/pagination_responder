require 'test_helper'

class PaginationResponderTest < ActionController::TestCase
  tests ArtistsController
  
  setup do
    100.times { Artist.create(name: "foo") }
  end

  def json
    JSON.parse(response.body)
  end

  test "pagination results" do
    get :index, format: :json, page: 1

    assert_response :success
    assert_equal 25, json.length
    assert_kind_of Array, json
  end

  test "pagination headers" do
    get :index, format: :json, page: 2

    assert_response :success
    assert_includes response.headers, "Pagination-Limit"
    assert_includes response.headers, "Pagination-Offset"
    assert_includes response.headers, "Pagination-Count"
  end
end
