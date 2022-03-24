class Spent < ApplicationRecord
    AUTHORIZED_PARTICIPANTS = ["Roro", "Choco", "Loulou"]
    # validates :participants, inclusion: { in: AUTHORIZED_PARTICIPANTS}

    has_and_belongs_to_many :user
    has_one :debt, dependent: :destroy
    accepts_nested_attributes_for :debt

    def self.totalWhiteSpent
        @counter = 0
        all.each do |s|
            @counter += s.white_spent ? s.white_spent : 0
        end
        return @counter
    end

    def self.totalBlackSpent
        @counter = 0
        all.each do |s|
            @counter += s.black_spent ? s.black_spent : 0
        end
        return @counter
    end
end
