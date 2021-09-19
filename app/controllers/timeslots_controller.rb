class TimeslotsController < ApplicationController
  def create
    @venue = Venue.find(params[:venue_id])
    @timeslot = @venue.timeslots.build(timeslot_params)
    if @timeslot.save
      redirect_to @venue
    else
      redirect_to root_path
    end
  end

  def destroy
    @venue = Venue.find(params[:venue_id])
    @timeslot = @venue.timeslots.find(params[:id])
    @timeslot.destroy
    redirect_to @venue
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:day, :start_time, :end_time)
  end
end
