class SearchController < ApplicationController

	def index 

		if params[:query].present?
			@vals = {"coupons" => Coupon.where("description like ? or name like ?", "%#{params[:search]}%", "%#{params[:search]}%"), "merchants" => Merchant.where("description like ? or name like ?" , "%#{params[:search]}%","%#{params[:search]}%")}
		end
		if (params[:callback].present?)
			render json: @vals, callback: params[:callback]
		else
			render json: @vals
		end
	end
end
