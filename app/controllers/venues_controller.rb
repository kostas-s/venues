class VenuesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authenticate_user!, except: %i[show index]

  def index
    @venues = Venue.all.order(:created_at)
  end

  def show
    @venue = Venue.includes(:timeslots).find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: 'Venue was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to root_path, notice: 'Venue was successfully deleted'
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to root_path, notice: 'Venue was successfully created'
    else
      render :new
    end
  end

  private

  def venue_params
    params
      .require(:venue)
      .permit(
        :name,
        :short_description,
        :long_description,
        :address,
        :lng,
        :lat
        # images: [],
      )
  end

  def record_not_found
    render plain: '404 Not Found', status: :not_found
  end
end
