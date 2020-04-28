class PostsController < ApplicationController
  before_action :authenticate_team!
  before_action :set_post, only: [:edit, :update, :show]

  def index
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_team.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "スレッドを作成しました"
    else
      render :new
    end
  end

  def show
    @post = Post.with_team_and_comment.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
