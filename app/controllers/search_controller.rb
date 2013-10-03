class SearchController < ApplicationController
	authorize_resource :class => false
	def index 

		if params[:query].present?
			@vals = {"coupons" => Coupon.where("description like ? or name like ?", "%#{params[:query]}%", "%#{params[:query]}%"), "merchants" => Merchant.where("description like ? or name like ?" , "%#{params[:query]}%","%#{params[:query]}%")}
		end
		if (params[:callback].present?)
			render json: @vals, callback: params[:callback]
		else
			render json: @vals
		end
	end
end
