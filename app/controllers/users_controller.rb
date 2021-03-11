class UsersController < ApplicationController
  @user = User.new

  def show
    @user = User.find(params[:id])
    @tags = @user.tag_counts_on(:tags)
    @posts = @user.posts
  end

  def user_params
    params.require(:user).permit(:name, :tag_list)
  end

end
