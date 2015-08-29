class CommentsController < ApplicationController
  def index
    @ohaka = Ohaka.find(params[:ohaka_id])
    @comment = @ohaka.comments.create(comment_params)
    redirect_to ohaka_path(@ohaka)
  end

  def create
    @ohaka = Ohaka.find(params[:ohaka_id])
    @comment = @ohaka.comments.create(comment_params)
    redirect_to ohaka_path(@ohaka)
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
