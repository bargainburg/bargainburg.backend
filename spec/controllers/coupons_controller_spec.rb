require 'spec_helper'

describe CouponsController do
  setup :activate_authlogic

  shared_examples "a working controller" do
    describe '#index' do
      it 'responds with 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  context "anonymous user" do
    it_behaves_like "a working controller"

    describe '#show' do

      it 'should render a valid, visible coupon' do
        get :show, :id => FactoryGirl.create(:valid_visible_coupon)
        expect(response.status).to eq(200)
      end

      it "shouldn't render a hidden coupon" do
        get :show, :id => FactoryGirl.create(:hidden_coupon)
        expect(response.status).to eq(401)
      end

      it "shouldn't render an expired coupon" do
        get :show, :id => FactoryGirl.create(:expired_coupon)
        expect(response.status).to eq(401)
      end

      it "shouldn't render a coupon that hasn't started yet" do
        get :show, :id => FactoryGirl.create(:future_coupon)
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

    it_behaves_like "a working controller"
  end
end
