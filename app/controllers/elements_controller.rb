class ElementsController < ApplicationController
  before_action :set_post
  before_action :set_element, only: [:update, :destroy ]

  def create
    @element = @post.elements.build(element_params)

    if @element.save
      notice = nil
    else
      notice = @element.errors.full_messages.join(". ") << '.'
    end
    redirect_to edit_post_path(@post)
  end

  def update
      @element.update(element_params)
      redirect_to edit_post_path(@element.post)
  end

  def destroy
    @element.destroy
    redirect_to edit_post_path(@element.post)
  end

  private

  def set_post
    @post = current_user.posts.find(params[:post_id])
  end

  def set_element
    @element = @post.elements.find(params[:id])
  end

  def element_params
    params.require(:element).permit(:element_type, :content, :image)
  end
end
