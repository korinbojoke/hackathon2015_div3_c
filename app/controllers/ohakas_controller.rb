class OhakasController < ApplicationController
  def index
    @ohakas = Ohaka.search(params[:search])
  end

  def new
  end

  def create
    @ohaka = Ohaka.new(ohaka_params)
    if @ohaka.save
      redirect_to @ohaka
    else
      render 'new'
    end
  end

  def edit
    @ohaka = Ohaka.find(params[:id])
  end

  def show
    @ohaka = Ohaka.find(params[:id])
  end

  def update
    @ohaka = Ohaka.find(params[:id])

    if @ohaka.update(ohaka_params)
      redirect_to @ohaka
    else
      render 'edit'
    end
  end

  def destroy
    @ohaka = Ohaka.find(params[:id])
    @ohaka.destroy
    redirect_to ohakas_path
  end

  def search

  end
  private
  def ohaka_params
    params.require(:ohaka).permit(:name,:image,:image_cache, :remove_image,:location,:activity,:orin_num,:senko_num)
  end
end
