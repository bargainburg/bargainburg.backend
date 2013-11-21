require 'spec_helper'

describe PointOfContactsController do
  setup :activate_authlogic
  
  context "anonymous user" do
	describe "#show" do
	  it "should render a valid point of contact" do
	    get :show, :id => FactoryGirl.create(:point_of_contact)
        expect(response.status).to eq(200)
	  end
	end
  
	describe "#create, #update" do
	  it "shouldn't authorize #create" do
        post :create, :point_of_contact => FactoryGirl.build(:point_of_contact).as_json
        expect(response.status).to eq(401)
      end
	  
	  it "shouldn't authorize #update" do
        patch :update, :id => FactoryGirl.create(:point_of_contact)
        expect(response.status).to eq(401)
      end
	end
  end
  
  context "logged in user" do
    let (:user) { FactoryGirl.create(:user) }
    let (:merchant) { FactoryGirl.create(:merchant, user: user) }

    setup do
      log_in user
    end
	
	describe "#show" do
	  it "should render a valid point of contact" do
	    get :show, :id => FactoryGirl.create(:point_of_contact)
        expect(response.status).to eq(200)
	  end
	end
	
	describe "#create" do
	  it "shouldn't allow the creation of a point of contact with no name" do
	    post :create, :point_of_contact => FactoryGirl.build(:poc_no_name, :merchant => merchant).as_json
        expect(response.status).to eq(422)
	  end
	  
	  it "shouldn't allow the creation of a point of contact with no phone" do
	    post :create, :point_of_contact => FactoryGirl.build(:poc_no_phone, :merchant => merchant).as_json
        expect(response.status).to eq(422)
	  end
	  
	  it "shouldn't allow the creation of a point of contact with no email" do
	    post :create, :point_of_contact => FactoryGirl.build(:poc_no_email, :merchant => merchant).as_json
        expect(response.status).to eq(422)
	  end
	  
	  it "should allow the creation of a valid point of contact" do
	    post :create, :point_of_contact => FactoryGirl.build(:point_of_contact, :merchant => merchant).as_json
        expect(response.status).to eq(201)
	  end
	end
	
	describe "#update" do
	  it "shouldn't allow updating a point of contact with no name" do
	    id = FactoryGirl.create(:point_of_contact, :merchant => merchant)
	    patch :update, :id => id, :point_of_contact => FactoryGirl.build(:poc_no_name, :merchant => merchant).as_json
        expect(response.status).to eq(422)
	  end
	  
	  it "shouldn't allow updating a point of contact with no phone" do
	    id = FactoryGirl.create(:point_of_contact, :merchant => merchant)
	    patch :update, :id => id, :point_of_contact => FactoryGirl.build(:poc_no_phone, :merchant => merchant).as_json
        expect(response.status).to eq(422)
	  end
	  
	  it "shouldn't allow updating a point of contact with no email" do
	    id = FactoryGirl.create(:point_of_contact, :merchant => merchant)
	    patch :update, :id => id, :point_of_contact => FactoryGirl.build(:poc_no_email, :merchant => merchant).as_json
        expect(response.status).to eq(422)
	  end
	  
	  it "should allow updating a valid point of contact" do
	    patch :update, :id => FactoryGirl.create(:point_of_contact, :merchant => merchant)
        expect(response.status).to eq(204)
	  end
	end
  end
end