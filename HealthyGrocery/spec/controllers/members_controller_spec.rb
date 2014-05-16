require "spec_helper"

describe MembersController do
  describe "GET #hub" do
    it "responds successfully with an HTTP 200 status code" do
      get :hub
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the hub template" do
      get :hub
      expect(response).to render_template("hub")
    end
  end
  end
end