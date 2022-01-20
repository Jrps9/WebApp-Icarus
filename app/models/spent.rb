class Spent < ApplicationRecord
    AUTHORIZED_PARTICIPANTS = ["Roro", "Choco", "Jean-Jean"]
    validates :category, inclusion: { in: AUTHORIZED_PARTICIPANTS }

    belongs_to :user

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
