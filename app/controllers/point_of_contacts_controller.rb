class PointOfContactsController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]

  # GET /point_of_contacts
  # GET /point_of_contacts.json
  def index
    if params[:merchant_id].present?
      @point_of_contacts = @point_of_contacts.where(:merchant_id => params[:merchant_id])
    end

    render json: @point_of_contacts, callback: params[:callback]
  end

  # GET /point_of_contacts/1
  # GET /point_of_contacts/1.json
  def show
    render json: @point_of_contact, callback: params[:callback]
  end

  # POST /point_of_contacts
  # POST /point_of_contacts.json
  def create
	@point_of_contact = PointOfContact.new(params[:point_of_contact])
	@point_of_contact.merchant = current_user.merchant
	authorize! :create, @point_of_contact
	
    if @point_of_contact.save
      render json: @point_of_contact, status: :created, location: @point_of_contact
    else
      render json: @point_of_contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /point_of_contacts/1
  # PATCH/PUT /point_of_contacts/1.json
  def update
    if @point_of_contact.update(params[:point_of_contact])
      head :no_content
    else
      render json: @point_of_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /point_of_contacts/1
  # DELETE /point_of_contacts/1.json
  def destroy
    @point_of_contact.destroy

    head :no_content
  end
end
