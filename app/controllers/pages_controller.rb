class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

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

  # def treasury
  #   @spents = Spent.all
  #   @spent = Spent.new
  #   @loulouspent = Spent.where(:user_id => 1).totalWhiteSpent
  #   @rorospent = Spent.where(:user_id => 2).totalWhiteSpent
  #   @chocospent = Spent.where(:user_id => 3).totalWhiteSpent
  # end

  def tricount

  end

end
