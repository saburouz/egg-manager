class ResultsController < ApplicationController
  def show
    @result = Result.find(params[:id])
    @lot = @result.lot
    @results = @lot.results.order(date:"DESC")
  end

  def new
  end

  def create
    @lot = Lot.find(params[:lot_id])
    
    @search = Result.find_by(date: params[:result][:date])
    if (@search != nil)
      flash[:danger] = '指定日の記録は存在しています。'
      redirect_to @lot
      return
    end
    @result = Result.new(result_params)
    @result.lot_id = @lot.id
    @result.user_id = current_user.id
    @result.rate = (@lot.bird_house - @result.bird_dead).to_f / @lot.bird_house.to_f
    if @result.save
      flash[:success] = '今日の記録に成功しました。'
      redirect_to @lot
    else
      flash.now[:danger] = '今日の記録に失敗しました。'
      render 'lots/show'
    end    
    
  end

  def update
      @lot = Lot.find(params[:lot_id])
     @result = Result.find(params[:id])
     @result.user_id = current_user.id
     if @result.update(result_params)
        flash[:success] = "記録を更新しました"
        redirect_to @lot       
     else
     end
    
    
  end

  def edit
    @result = Result.find(params[:id])
    @lot = @result.lot
  end

  def delete
  end
end

private

#Strong Parameter
def result_params
  params.require(:result).permit(:date, :egg_count, :egg_weight, :bird_dead)
end