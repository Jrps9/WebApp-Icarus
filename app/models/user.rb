class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservation
  has_many :spent
  def allWhiteSpent
    @counter = 0
    self.spent.all.each do |s|
      @counter += s.white_spent ? s.white_spent : 0
    end
    return @counter
  end
  def allBlackSpent
    @counter = 0
    self.spent.all.each do |s|
      @counter += s.black_spent ? s.black_spent : 0
    end
    return @counter
  end
end
