class CommentsController < ApplicationController
  def create
    @comment = current_team.comments.new(comment_params)
    if @comment.save
      redirect_to posts_path, notice: "投稿しました。"
    else
      render template: "posts/index"
    end
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   redirect_to posts_path, notice: "投稿を削除しました。"
  # end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
