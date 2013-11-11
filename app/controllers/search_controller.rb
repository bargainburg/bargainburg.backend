class SearchController < ApplicationController

  skip_authorization_check

  def index

    if params[:query].present?
      query = "%#{params[:query]}%"
      @coupons = Coupon.accessible_by(current_ability).where("coupons.description like ? or coupons.name like ?", query, query).order('name ASC')
      @merchants = Merchant.accessible_by(current_ability).where("merchants.description like ? or merchants.name like ?" , query, query).order('name ASC')
      @vals = @coupons.map {|c| c.as_json.merge(:type => "coupon") }.concat(@merchants.map {|m| m.as_json.merge(:type => "merchant")})
      @vals.sort! {|a,b| a[:name] <=> b[:name] }
    end

    @vals ||= []

    render json: @vals, callback: params[:callback]
  end
end
