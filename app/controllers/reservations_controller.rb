class ReservationsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    def index
      @reservations = Reservation.all
      @reservation = Reservation.new
      @reservations_dates = @reservations.map do |reservation|
        {
          from: reservation.start_day,
          to: reservation.end_day
        }
      end
      # if (current_user)
      # @admin = current_user.admin
      # end
    end

    def show
      @reservation = Reservation.find(params[:id])
      @reservationvalue = @reservation.id
      @lastreservation = Reservation.last
      @nextreservation = Reservation.where("id < ?", @reservationvalue).last
    end

    def destroy
      reservation = Reservation.find(params[:id])
      reservation.destroy
      redirect_to reservations_path, notice: "La sortie a été supprimée"
    end

    def edit
      @reservation = Reservation.find(params[:id])
    end

    def update
      @reservation = Reservation.find(params[:id])
      @reservation.update(reservation_params)
      redirect_to reservations_path(@reservations), notice: "Sortie mise à jour !"
    end

    def create
      @reservation = Reservation.new(reservation_params)
      @reservation.user = current_user
      if @reservation.save
        redirect_to reservations_path(@reservation), notice: "Sortie validée !"
      else
      render :new
      end
    end

    private

    def reservation_params
      params.require(:reservation).permit(:name, :destination, :start_day, :end_day, :latitude, :longitude, :description, photos: [])
    end
end
