class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @tags = @user.tag_counts_on(:tags)
    @posts = @user.posts
  end

  private
  def user_params
    params.require(:user).permit(:name, :tag_list)
  end

end
