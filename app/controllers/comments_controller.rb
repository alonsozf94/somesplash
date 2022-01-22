class CommentsController < ApplicationController
  # POST /categories/:category_id/comments
  # POST /photos/:photo_id/comments
  def create
    @commentable_object =  params[:category_id] ? Category.find_by_id(params[:category_id]) : Photo.find_by_id(params[:photo_id])
    @comment = @commentable_object.comments.create(comment_params)

    @photo = @commentable_object
    @comments = @photo.comments
    
    if @comment.save
      redirect_to category_path(@commentable_object) if @commentable_object.instance_of? Category
      redirect_to photo_path(@commentable_object) if @commentable_object.instance_of? Photo
    else
      redirect_to category_path(@commentable_object) if @commentable_object.instance_of? Category
      #redirect_to photo_path(@commentable_object) if @commentable_object.instance_of? Photo
      render "photos/show", status: :unprocessable_entity if @commentable_object.instance_of? Photo
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
