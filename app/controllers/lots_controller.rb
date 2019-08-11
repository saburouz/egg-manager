class LotsController < ApplicationController
  def index
    @lots = Lot.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @lot = Lot.find(params[:id])
    @result = Result.new # form_with 用
    @results = @lot.results.order(date:"DESC").page(params[:page])
  end

  def new
    @lot = Lot.new
  end

  def create
    @lot = Lot.new(lot_params)
    
    if @lot.save
      flash[:success] = '新しいロットを登録しました。'
      redirect_to lots_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end    
    
  end
  
  def graph
    @lot = Lot.find(params[:id])
    @results = @lot.results.order(date:"ASC")
    #gon.date = @results.date
  end

  def update
  end

  def edit
  end
end

private

#Strong Parameter
def lot_params
  params.require(:lot).permit(:lot_name, :start_date, :bird_house)
end
