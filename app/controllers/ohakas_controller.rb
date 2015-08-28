class OhakasController < ApplicationController
  def index
  end

  def new
  end

  def create
    @ohaka = Ohaka.new(ohaka_params)
    @ohaka.save
    redirect_to @ohaka
  end

  def show
    @ohaka = Ohaka.find(params[:id])
  end

  private
  def ohaka_params
    params.require(:ohaka).permit(:name,:image,:location,:activity,:orin_num,:senko_num)
  end
end
