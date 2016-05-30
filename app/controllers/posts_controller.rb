class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    binding.pry
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render action :index
    else
      render action :new
    end
  end

  def update
    if @post.update(post_params)
      render action :index
    else
      render action :edit
    end
  end

  def destroy
    @post.destroy
    render action :index
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
