class SearchController < ApplicationController

  skip_authorization_check

  def index

    if params[:query].present?
      query = "%#{params[:query]}%"
      @coupons = Coupon.accessible_by(current_ability).where("description like ? or name like ?", query, query).order('name ASC')
      @merchants = Merchant.accessible_by(current_ability).where("description like ? or name like ?" , query, query).order('name ASC')
      @categories = Category.accessible_by(current_ability).where("name like ?", query).order('name ASC')
      @vals = @coupons.concat(@merchants).concat(@categories)
      @vals.sort! {|a,b| a.name <=> b.name }
    end

    @vals ||= []

    render json: @vals, callback: params[:callback]
  end
end
