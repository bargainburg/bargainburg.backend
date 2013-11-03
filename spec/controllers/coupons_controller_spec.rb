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

      it "shouldn't render a coupon from an unapproved merchant" do
        m = FactoryGirl.create(:unpproved_merchant)
        c = FactoryGirl.create(:valid_visible_coupon, :merchant => m)
        get :show, :id => c
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
        post :create, :coupon => FactoryGirl.build(:coupon).as_json
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

    describe "#show" do

      context "another merchant's coupon" do
        it "renders a valid, visible coupon" do
          get :show, :id => FactoryGirl.create(:valid_visible_coupon)
          expect(response.status).to eq(200)
        end

        it "shouldn't render an expired coupon" do
          get :show, :id => FactoryGirl.create(:expired_coupon)
          expect(response.status).to eq(401)
        end

        it "shouldn't render a future coupon" do
          get :show, :id => FactoryGirl.create(:future_coupon)
          expect(response.status).to eq(401)
        end

        it "shouldn't render a hidden coupon" do
          get :show, :id => FactoryGirl.create(:hidden_coupon)
          expect(response.status).to eq(401)
        end
      end

      context "this merchant's coupon" do
        it "renders a valid, visible coupon" do
          get :show, :id => FactoryGirl.create(:valid_visible_coupon, :merchant => merchant)
          expect(response.status).to eq(200)
        end

        it "renders an expired coupon" do
          get :show, :id => FactoryGirl.create(:expired_coupon, :merchant => merchant)
          expect(response.status).to eq(200)
        end

        it "renders a future coupon" do
          get :show, :id => FactoryGirl.create(:future_coupon, :merchant => merchant)
          expect(response.status).to eq(200)
        end

        it "renders a hidden coupon" do
          get :show, :id => FactoryGirl.create(:hidden_coupon, :merchant => merchant)
          expect(response.status).to eq(200)
        end
      end

    end

    describe "#index" do
      it "renders only valid, visible coupons from other merchants" do
        m = FactoryGirl.create(:approved_merchant)
        FactoryGirl.create_list(:hidden_coupon, 2, :merchant => m)
        FactoryGirl.create_list(:expired_coupon, 2, :merchant => m)
        FactoryGirl.create_list(:future_coupon, 2, :merchant => m)
        FactoryGirl.create_list(:valid_visible_coupon, 3, :merchant => m)

        get :index
        expect(JSON.parse(response.body).size).to eq(3)
      end

      it "renders all coupons for this merchant" do
        FactoryGirl.create_list(:hidden_coupon, 2, :merchant => merchant)
        FactoryGirl.create_list(:expired_coupon, 2, :merchant => merchant)
        FactoryGirl.create_list(:future_coupon, 2, :merchant => merchant)
        FactoryGirl.create_list(:valid_visible_coupon, 3, :merchant => merchant)

        get :index
        expect(JSON.parse(response.body).size).to eq(9)
      end

      context "?merchant_id=" do
        it "renders all coupons for this merchant" do
          FactoryGirl.create_list(:hidden_coupon, 2, :merchant => merchant)
          FactoryGirl.create_list(:expired_coupon, 2, :merchant => merchant)
          FactoryGirl.create_list(:future_coupon, 2, :merchant => merchant)
          FactoryGirl.create_list(:valid_visible_coupon, 3, :merchant => merchant)

          get :index, :merchant_id => merchant
          expect(JSON.parse(response.body).size).to eq(9)
        end

        it "renders only valid, visible coupons for other merchants" do
          m = FactoryGirl.create(:approved_merchant)

          FactoryGirl.create_list(:hidden_coupon, 2, :merchant => m)
          FactoryGirl.create_list(:expired_coupon, 2, :merchant => m)
          FactoryGirl.create_list(:future_coupon, 2, :merchant => m)
          FactoryGirl.create_list(:valid_visible_coupon, 3, :merchant => m)

          get :index, :merchant_id => m
          expect(JSON.parse(response.body).size).to eq(3)
        end
      end

    end
	
	describe "#create" do
	  it "should not allow the creation of an invalid coupon" do
		post :create, :coupon => {:image => Rails.root + 'spec/fixtures/files/Spongebob.gif', :merchant => merchant}
		expect(response.status).to eq(422)
	  end
	  
	  it "should allow the creation of a valid coupon" do
        post :create, :coupon => FactoryGirl.build(:coupon, :merchant => merchant).as_json
        expect(response.status).to eq(201)
      end
	end
	  
	describe "#update" do
	  it "should allow the update of a coupon" do
        patch :update, :id => FactoryGirl.create(:coupon, :merchant => merchant)
        expect(response.status).to eq(204)
      end
	end
  end
end
