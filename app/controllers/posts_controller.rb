class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy] 

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post was successfully saved..!"
      redirect_to :action => "index"
    else
      flash[:notice] = "Something went wrong. Please check & try again..!"
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was successfully saved..!"
      redirect_to :action => "index"
    else
      flash[:notice] = "Something went wrong. Please check & try again..!"
      render :action => "new"
    end
  end

  def destroy
  	@post.destroy
  	flash[:notice] = "Post was successfully saved..!"
    redirect_to :action => "index"
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end

end
