class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservation
  has_and_belongs_to_many :works
  has_and_belongs_to_many :debts

  def isHeInDebt(debt)
    return debt.cbOnMeDoit.include?(self)
  end

  def allWhiteSpent
    @counter = 0
    Spent.where(:user_id => self.id).each do |s|
      @counter += s.white_spent ? s.white_spent : 0
    end
    return @counter
  end

  def allBlackSpent
    @counter = 0
    Spent.where(:user_id => self.id).each do |s|
      @counter += s.black_spent ? s.black_spent : 0
    end
    return @counter
  end

  # def whoLendMe
  #   spentIdArray = []
  #   self.debts.each do |d|
  #     if d.spent.user_id != self.id
  #       spentIdArray << d.spent_id
  #     end
  #   end
  #   return spentIdArray
  # end

  # def cbOnMeDoit
  #   totalPret = []
  #   self.debts.each do |d|
  #     if d.spent.user_id == self.id
  #       totalPret << (d.amount / d.user_ids.size)
  #     end
  #   end
  #   return totalPret
  # end

end
