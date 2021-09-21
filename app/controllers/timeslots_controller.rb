class TimeslotsController < ApplicationController
  before_action :find_venue, only: %i[create destroy]

  def create
    @timeslot = @venue.timeslots.build(timeslot_params)
    if @timeslot.save
      redirect_to @venue, notice: 'Timeslot was successfully created'
    else
      redirect_to venue_path(@venue), notice: 'Timeslot could not be created'
    end
  end

  def destroy
    @timeslot = @venue.timeslots.find(params[:id])
    @timeslot.destroy
    redirect_to @venue, notice: 'Timeslot was successfully deleted'
  end

  private

  def find_venue
    @venue = Venue.find(params[:venue_id])
  end

  def timeslot_params
    params.require(:timeslot).permit(:day, :start_time, :end_time)
  end
end
