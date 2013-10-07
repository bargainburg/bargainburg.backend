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

    describe "#index" do
      it "should render only valid, visible coupons from any merchant" do
        FactoryGirl.create_list(:valid_visible_coupon, 4)
        FactoryGirl.create_list(:hidden_coupon, 3)
        FactoryGirl.create_list(:expired_coupon, 2)
        FactoryGirl.create_list(:future_coupon, 1)
        get :index
        expect(JSON.parse(response.body).size).to eq(4)
      end

      context "?merchant_id=" do
        it "should render coupons from a specific approved merchant" do
          m1, m2 = FactoryGirl.create_list(:approved_merchant, 2)
          FactoryGirl.create_list(:valid_visible_coupon, 4, :merchant => m1)
          FactoryGirl.create_list(:valid_visible_coupon, 2, :merchant => m2)
          get :index, :merchant_id => m1
          expect(JSON.parse(response.body).size).to eq(4)
        end


        it "should only render valid, visible coupons" do
          m = FactoryGirl.create(:approved_merchant)
          FactoryGirl.create_list(:valid_visible_coupon, 4, :merchant => m)
          FactoryGirl.create_list(:expired_coupon, 3, :merchant => m)
          get :index, :merchant_id => m
          expect(JSON.parse(response.body).size).to eq(4)
        end

        it "shouldn't render any coupons from an unapproved merchant" do
          m = FactoryGirl.create(:unpproved_merchant)
          FactoryGirl.create_list(:valid_visible_coupon, 4, :merchant => m)
          get :index, :merchant_id => m
          expect(response.status).to eq(401)
        end

      end
    end

    describe "#create, #update, #delete" do
      it "shouldn't authorize #create" do
        post :create, FactoryGirl.build(:coupon)
        expect(response.status).to eq(401)
      end

      it "shouldn't authorize #update" do
        patch :update, :id => FactoryGirl.create(:coupon)
        expect(response.status).to eq(401)
      end

      it "shouldn't authorize #destroy" do
        delete :destroy, :id => FactoryGirl.create(:coupon)
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
