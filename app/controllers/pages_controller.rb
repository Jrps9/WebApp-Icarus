class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def captain
  end

  def home
  end

  def map
    @reservations = Reservation.all

    @markers = @reservations.map do |marker|
      {
        lat: marker.latitude,
        lng: marker.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { marker: marker })
      }
    end
  end

end
