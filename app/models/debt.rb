class Debt < ApplicationRecord
  belongs_to :spent
  has_and_belongs_to_many :user

  def paid?
    return ((self.paid_1 && self.paid_2 && self.paid_3))
  end

  def quiDoitQuoi
    creator = User.find_by(:id => self.spent.user_id)
    participants = self.user_ids.excluding(creator.id)
    debt = self.amount / self.user_ids.size
    users = []
    participants.each do |participant|
      users << User.find_by(:id => participant).name + "#{debt}"
    end
    return users
  end

  def self.unpaidDebts
    unpaidDebts = []
    all.each do |ud|
      if !ud.paid?
        unpaidDebts << ud
      end
    end
    return unpaidDebts
    loulouVsRoro = 0
    loulouVsChoco = 0
    roroVsLoulou = 0
    roroVsChoco = 0
    chocoVsLoulou = 0
    chocoVsRoro = 0

    unpaidDebts.each do |md|
      debt = md.amount / md.user_ids.size
      if md.paid_1 == false &&
        if md.id == 2
          loulouVsRoro += debt
        else
          loulouVsChoco += debt
        end
      end
      if md.paid_2 == false
        if md.id == 1
          roroVsLoulou += debt
        else
          roroVsChoco += debt
        end
      end
      if md.paid_3 == false
        if md.id == 1
          chocoVsLoulou += debt
        else
          chocoVsRoro += debt
        end
      end
    end

    loulouDebtRoro = loulouVsRoro - roroVsLoulou
    loulouDebtChoco = loulouVsChoco - chocoVsLoulou

    loulouTotalDebt = loulouDebtChoco + loulouDebtRoro

    roroDebtLoulou = loulouVsRoro - roroVsLoulou
    roroDebtChoco = chocoVsRoro - roroVsChoco

    roroTotalDebt = roroDebtChoco + roroDebtLoulou

    return [loulouTotalDebt, roroTotalDebt]
  end

  def creator(current_user)
    return current_user.id == self.spent.user_id
  end

  def creatorName
    return (User.find_by(:id => self.spent.user_id)).name
  end

  def participants
    participants = self.user_ids
    participants.map do |p|
      User.find_by(:id => p)
    end
  end

  def debtPart
    return self.amount / self.user_ids.size
  end

  def cbOnMeDoit
    participants = self.spent.user_ids.excluding(self.spent.user_id)

    beneficiaires = self.spent.user_ids.size
    montant = self.amount
    dette = (montant / beneficiaires)
    userEnDette = []
    participants.each do |userP|
      user = User.find_by(:id => userP)
      if !((self.paid_1 && user.id == 1) || (self.paid_2 && user.id == 2) || (self.paid_3 && user.id == 3))
      # userEnDette << ("#{user} te doit encore
      #   #{self.paid_1} #{dette}€")
        userEnDette << user
      end
    end
    return userEnDette
  end



  def self.general
    loulou = User.find_by(:name => "Loulou")
    choco = User.find_by(:name => "Choco")
    roro = User.find_by(:name => "Roro")
    roroDebt = []
    chocoDebt = []
    loulouDebt = []
    all.each do |d|
      if !d.paid?
        if d.user_ids != []
          createur = User.find_by(:id => d.spent.user_id)
          participants = d.user_ids.excluding(d.spent.user_id)
          participant1 = User.find_by(:id => participants[0])
          participant2 = User.find_by(:id => participants[1])
          montant = d.amount
          partDebt = (montant / d.user_ids.size)
          if ((participant1 == roro || participant2 == roro) && !d.paid_2)
            roroDebt << {montant_du: partDebt, crediteur: createur.name}
          end
          if ((participant1 == choco || participant2 == choco) && !d.paid_3)
            chocoDebt << {montant_du: partDebt, crediteur: createur.name}
          end
          if ((participant1 == loulou || participant2 == loulou) && !d.paid_1)
            loulouDebt << {montant_du: partDebt, crediteur: createur.name}
          end
        end
      end
    end

    roroCounterLoulou = 0
    roroCounterChoco = 0
    roroDebt.each do |rd|
      if (rd.has_value?("Loulou"))
        roroCounterLoulou += rd[:montant_du]
      end
      if (rd.has_value?("Choco"))
        roroCounterChoco += rd[:montant_du]
      end
    end

    chocoCounterLoulou = 0
    chocoCounterRoro = 0
    chocoDebt.each do |rd|
      if (rd.has_value?("Loulou"))
        chocoCounterLoulou += rd[:montant_du]
      end
      if (rd.has_value?("Roro"))
        chocoCounterRoro+= rd[:montant_du]
      end
    end

    loulouCounterChoco= 0
    loulouCounterRoro = 0
    loulouDebt.each do |rd|
      if (rd.has_value?("Choco"))
        loulouCounterChoco += rd[:montant_du]
      end
      if (rd.has_value?("Roro"))
        loulouCounterRoro+= rd[:montant_du]
      end
    end

    response = []

    roroDebtChoco = roroCounterChoco - chocoCounterRoro
    roroDebtLoulou = roroCounterLoulou - loulouCounterRoro

    chocoDebtRoro = chocoCounterRoro - roroCounterChoco
    chocoDebtLoulou = chocoCounterLoulou - loulouCounterChoco

    loulouDebtRoro = loulouCounterRoro - roroCounterLoulou
    loulouDebtChoco = loulouCounterChoco - chocoCounterLoulou

    if (roroDebtChoco > 0)
      response += "Roro doit #{roroDebtChoco} à Choco"
    end
    if (roroDebtLoulou > 0)
      response << "Roro doit #{roroDebtLoulou} à Loulou"
    end

    if (chocoDebtRoro > 0)
      response << "Choco doit #{chocoDebtRoro} à Roro"
    end
    if (chocoDebtLoulou > 0)
      response << "Choco doit #{chocoDebtLoulou} à Loulou"
    end

    if (loulouDebtRoro > 0)
      response << "Loulou doit #{loulouDebtRoro} à Roro"
    end

    if (loulouDebtChoco > 0)
      response << "Loulou doit #{loulouDebtChoco} à Choco"
    end

    return [response, response]

  end

end
