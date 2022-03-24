class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def captain
  end

  def home
  end

  def map
    @reservations = Reservation.all
    # @reservations_dates = @reservations.map do |reservation|
    #   {
    #     from: reservation.start_day,
    #     to: reservation.end_day
    #   }
    # end
    # if (current_user)
    # @admin = current_user.admin
    # end

    @markers = @reservations.geocoded.map do |reservation|
      {
        lat: reservation.latitude,
        lng: reservation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { reservation: reservation })
      }
    end
  end
end
