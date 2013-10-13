require 'spec_helper'

describe UsersController do
  setup :activate_authlogic

  context "anonymous user" do

    it 'should allow the creation of a user' do
      post :create, :user => {:email => FactoryGirl.generate(:email),
                              :password => "test123",
                              :password_confirmation => "test123"}
      expect(response.status).to eq(201)
    end

    it 'should log in the user after creation' do
      post :create, :user => {:email => FactoryGirl.generate(:email),
                              :password => "test123",
                              :password_confirmation => "test123"}
      u = User.find(JSON.parse(response.body)["id"])
      puts controller.session["user_credentials"], u.persistence_token
    end

  end

end
