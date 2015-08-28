class OhakasController < ApplicationController
  def index
  end
  def new
  end

  private
  def ohaka_params
    params.require(:ohaka).permit(:name)
  end
end
