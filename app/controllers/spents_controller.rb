class SpentsController < ApplicationController
    def index
        @spents = Spent.all
        @spent = Spent.new
        end

        def show
        @spent = Spent.find(params[:id])
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
        @spent.user = current_user
            if @spent.save
                redirect_to treasury_path, notice: "Dépense ajoutée ! Icarus vous remercie."
            else
                redirect_to root_path
            end
        end

        def treasury
            @spents = Spent.all
            @spent = Spent.new

            @loulouspent = Spent.where(:user_id => 1).totalWhiteSpent
            @rorospent = Spent.where(:user_id => 2).totalWhiteSpent
            @chocospent = Spent.where(:user_id => 3).totalWhiteSpent
            @totalspent = Spent.totalWhiteSpent

            allCaptain = [@loulouspent, @rorospent, @chocospent]

            @total = 0

            allCaptain.each do |debt|
                @total += debt
                @avanceur = []
                if debt > 0
                    @avanceur.push debt
                end
            end

            @captaindebt = @totalspent/3

            @louloudebt = (@loulouspent - @captaindebt)
            @rorodebt = (@rorospent - @captaindebt)
            @chocodebt = (@chocospent - @captaindebt)

            @whopaid =

            @toWho = (@louloudebt > @rorodebt) ? @louloudebt : @rorodebt
            @toWho2 = (@chocodebt > @toWho) ? @chocodebt : @toWho

            @louloustate= @louloudebt > 0 ? "loulou à avancé #{@louloudebt} €" : "loulou doit #{@louloudebt} €"
            @rorostate= @rorodebt > 0 ? "roro à avancé #{@rorodebt} €" : "roro doit #{@rorodebt} €"
            @chocostate= @chocodebt > 0 ? "choco à avancé #{@chocodebt} €" : "choco doit #{@chocodebt} €"





        end

        private

        def spent_params
        params.require(:spent).permit(:white_spent, :black_spent, :name)
        end
end
