class OhakasController < ApplicationController
  def index
    @ohakas = Ohaka.search(params[:search])
    @recent_name = Ohaka.order(:created_at).last.name
    if @recent_name == nil
      @recent_name = "いません"
    end
    @most_name = Ohaka.order(:senko_num).last.name
    if @most_name == nil
      @most_name = "いません"
    end
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
    if "countup" == params[:type]
      logger.debug "before: #{@ohaka.senko_num}"
      # @ohaka = Ohaka.find(params[:id])
      @ohaka.senko_num += 1
      @ohaka.save!
      logger.debug "after: #{@ohaka.senko_num}"
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def count
    logger.debug "before: #{@ohaka.senko_num}"
    @ohaka = Ohaka.find(params[:id])
    @ohaka.senko_num += 1
    @ohaka.save
    logger.debug "after: #{@ohaka.senko_num}"
    render 'show'
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
  def count
    # logger.debug "before: #{@ohaka.senko_num}"
    # @ohaka = Ohaka.find(params[:id])
    # @ohaka.senko_num += 1
    # @ohaka.save
    # logger.debug "after: #{@ohaka.senko_num}"
    # render 'show'
  end
end
