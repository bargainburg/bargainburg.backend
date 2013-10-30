require 'spec_helper'

describe MerchantsController do
  setup :activate_authlogic

  context "logged in user" do
    let (:user) { FactoryGirl.create(:user) }

    setup do
      log_in user
    end

    it "should allow the association of the user on create" do
      post :create, :merchant => FactoryGirl.build(:unpproved_merchant, :user => user).as_json

      u = User.find(JSON.parse(response.body)["user_id"])

      expect(response.status).to eq(201)
      expect(u.id).to eq(user.id)
    end
	
	it "should remove the merchant when calling destroy" do
	  post :create, :merchant => FactoryGirl.build(:approved_merchant, :user =>user).as_json
	  u = User.find(JSON.parse(response.body)["user_id"])
	  delete :destroy, :id => u
	  expect(response.status).to eq(204)
	end

  end

end
