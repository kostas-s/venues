class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order(:created_at)
  end

  def show
    @venue = Venue.find(params[:id])
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
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to root_path
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to root_path
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
        :lat,
      )
  end
end
