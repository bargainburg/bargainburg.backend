class SearchController < ApplicationController

  skip_authorization_check

  def index

    if params[:query].present?
      query = "%#{params[:query]}%"
      @coupons = Coupon.where("(description like ? or name like ?) and hidden = 'f'", query, query).order('name ASC')
      @merchants = Merchant.where("(description like ? or name like ?) and approved = 't'" , query, query).order('name ASC')
      @vals = @coupons.map {|c| c.as_json.merge(:type => "coupon") }.concat(@merchants.map {|m| m.as_json.merge(:type => "merchant")})
      @vals.sort! {|a,b| a[:name] <=> b[:name] }
    end

    @vals ||= []

    render json: @vals, callback: params[:callback]
  end
end
