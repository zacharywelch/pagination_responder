require 'rails_helper'

shared_examples "pagination" do |path, factory, attributes = {}|

  before do
    create_list factory, 30, attributes
    get "#{path}?page=1"
  end

  it "#{path} returns page" do
    expect(response).to be_success
    expect(json).to be_an(Array)
    expect(json.length).to be 25
  end

  it "has pagination headers" do
    expect(response.headers).to include "Pagination-Limit"
    expect(response.headers).to include "Pagination-Offset"
    expect(response.headers).to include "Pagination-Count"
  end
end
