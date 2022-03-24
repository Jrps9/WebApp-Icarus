class DebtsController < ApplicationController
  def update
    @debt = Debt.find(params[:id])
    @spent = @debt.spent
    respond_to do |format|
      if @debt.update(debt_params)
        format.html {
          redirect_to @spent, notice: "Dette mise à jour !"
        }
        format.js
      else
        format.html {
          render :new
        }
      end
    end
  end

  def debt_params
    params.require(:debt).permit(:paid_1, :paid_2, :paid_3)
  end
end
