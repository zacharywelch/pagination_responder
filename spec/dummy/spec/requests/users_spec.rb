require 'rails_helper'

describe "Users" do
  
  let(:json) { JSON.parse(response.body) }
    
  describe "pagination" do

    before do
      create_list :user, 30
      get "/users?page=1"
    end

    it "/users returns page" do
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
end
