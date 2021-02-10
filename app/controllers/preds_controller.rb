class PredsController < ApplicationController
    def index
        @pred = Pred.new
        @preds = Pred.all
    end
     
    def create
       @pred = Pred.new(preds_params)
       if @pred.save
           redirect_to index_path
       else
           redirect_to index_path
       end
        
    end

    def destroy
        @pred = Pred.find(params[:id])
        @pred.destroy
        
        redirect_to index_path
    end

    def show
        redirect_to root_path
    end

    def main
        @preds = Pred.all
        if @preds.nil?
            flash[:alert] = 'Пустая база'
        else
            rand_id = rand(@preds.all.last.id) + 1
        while !Pred.exists?(id: rand_id) do
            rand_id = rand(@preds.all.last.id) + 1
        end
        @pred1 = Pred.find(rand_id)
    end
    end
     
    private
        def preds_params
            params.require(:pred).permit(:text)
        end
end
