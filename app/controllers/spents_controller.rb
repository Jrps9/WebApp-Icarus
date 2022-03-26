class SpentsController < ApplicationController
    def index
        @spents = Spent.all
    end

    def new
        @type = "spent"
        @spent = Spent.new
        @spent.build_debt
        respond_to do |format|
            format.html {
                flash.notice = "ca chie"
                redirect_to treasury_path
            }
            format.js
        end
    end

    def show
        @spent = Spent.find(params[:id])
        @debt = @spent.debt
        @spentvalue = @spent.id
        @lastspent = Spent.last
        @nextspent = Spent.where("id < ?", @spentvalue).last
    end

    def destroy
        spent = Spent.find(params[:id])
        spent.destroy
        redirect_to spents_path, notice: "La sortie a été supprimée"
    end

    def edit
    @spent = Spent.find(params[:id])
    end

    def update
    @spent = Spent.find(params[:id])
    @spent.update(spent_params)
    redirect_to spents_path(@spents), notice: "Sortie mise à jour !"
    end

    def create
        @spent = Spent.new(spent_params)
        @spent.debt.amount = @spent.white_spent
        team = params.dig(:spent, :participants)
        team.each do |member|
            if member != ""
              @spent.user << User.find_by(name: member)
              @spent.debt.user << User.find_by(name: member)
            end
        end
        @spent.user_id = current_user.id
        if @spent.save
            respond_to do |format|
                format.html {
                    flash.notice = "Dépense prise en compte !"
                    redirect_to treasury_path
                }
            end
        end
    end

    def treasury
        @spents = Spent.all
        @spent = Spent.new
        @data_cpts = ["Loulou","Roro","Choco"]
        @data_debts = Debt.general[1] == [0,0,0] ? [1,1,1] : Debt.general[1]
    end

    private

    def spent_params
        params.require(:spent).permit(:white_spent, :black_spent, :name, :description, debt_attributes: [:amount, :participants, :paid_1, :paid_2, :paid_3], :participants => [])
    end
end
