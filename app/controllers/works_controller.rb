class WorksController < ApplicationController

    def show
        @work = Work.find(params[:id])
    end

    def new
        @work = Work.new
        @type = "task"
    end

    def edit
        @work = Work.find(params[:id])
        @type = "task"
    end

    def update
        @work = Work.find(params[:id])
        @work.update(work_params)
        if @work.save
            redirect_to works_path(@works), notice: "Tâche mise à jour !"
        else
            redirect_to root_path, notice: "Quelque chose s'est mal passé..."
        end
    end

    def create
        @work = Work.new(work_params)
        team = params.dig(:work, :participants)
        team.each do |member|
            if member != ""
              @work.user << User.find_by(name: member)
            end
        end
        @work.user_id = current_user.id
            if @work.save
                flash.notice = "Tâche créer ! Bon courage !"
                redirect_to works_path
            else
                redirect_to root_path
            end
    end

    private

    def work_params
      params.require(:work).permit(:name, :description, :participants, :status)
    end

end
