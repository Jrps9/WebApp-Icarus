class Work < ApplicationRecord
  AUTHORIZED_PARTICIPANTS = ["Roro", "Choco", "Loulou"]
  # validates :participants, inclusion: { in: AUTHORIZED_PARTICIPANTS }

  has_and_belongs_to_many :user

  def state
    self.status == true ? "Réalisé" : "En cours"
  end

  def self.closed
    where(["status = ?", true])
  end

  def self.open
    where(["status = ?", false])
  end

  def workersName
    workers = []
    self.user.all.each do |u|
      if u != ""
        workers << u
      end
    end
    return workers
  end

  # Reservation.where("id < ?", @reservationvalue)

end
