class PointOfContactsController < ApplicationController
  # GET /point_of_contacts
  # GET /point_of_contacts.json
  def index
    @point_of_contacts = PointOfContact.all

    render json: @point_of_contacts
  end

  # GET /point_of_contacts/1
  # GET /point_of_contacts/1.json
  def show
    @point_of_contact = PointOfContact.find(params[:id])

    render json: @point_of_contact
  end

  # POST /point_of_contacts
  # POST /point_of_contacts.json
  def create
    @point_of_contact = PointOfContact.new(params[:point_of_contact])

    if @point_of_contact.save
      render json: @point_of_contact, status: :created, location: @point_of_contact
    else
      render json: @point_of_contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /point_of_contacts/1
  # PATCH/PUT /point_of_contacts/1.json
  def update
    @point_of_contact = PointOfContact.find(params[:id])

    if @point_of_contact.update(params[:point_of_contact])
      head :no_content
    else
      render json: @point_of_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /point_of_contacts/1
  # DELETE /point_of_contacts/1.json
  def destroy
    @point_of_contact = PointOfContact.find(params[:id])
    @point_of_contact.destroy

    head :no_content
  end
end
