class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @tags = Post.tag_counts_on(:tags).most_used(20)
    if @tag = params[:tag]
      @post = Post.tagged_with(params[:tag])
    end
  end

  def new
    @post = current_user.posts.new
  end

  def edit
    @element = @post.elements.new
    unless @post.user.id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to edit_post_path(@post)
    else
      render :new
    end
  end

  def show
    @tags = @post.tag_counts_on(:tags)
  end

  def update
    if @post.update(post_params)
      redirect_to edit_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    end
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:concept, :title, :image, :tag_list).merge(user_id: current_user.id)
  end
end
