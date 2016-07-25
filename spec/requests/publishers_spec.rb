require 'rails_helper'

RSpec.describe Publisher, type: :request do
  describe "GET /publisher" do
    it "works! (now write some real specs)" do
      get publishers_path
      expect(response).to have_http_status(200)
    end
  end
end
