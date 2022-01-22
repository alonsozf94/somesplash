class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  # Jesus
  def new
  end

  def create
  end

  # Claudia
  def edit
    @category = Category.where(id: params[:id])[0]
  end
  
  def update
    update_cat = Category.where(id: params[:id])[0]
    puts params
    if(update_cat.update(user_params))
      redirect_to categories_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:category).permit(:id, :name, :cover, :description)
  end
  
  # Ximena
  # GET /categories/:id
  def show
    @category = Category.find(params[:id])
    @photos = @category.photos
    @comments = @category.comments
    @comment = Comment.new
    
    # render category/show
  end

  # # POST /categories/:id/add_comment
  # def add_comment
  #   @category = Category.find(params[:id])
  #   @comment = @category.comments.new(comment_params)

  #   if @comment.save
  #     redirect_to category_path(@comment.commentable_type)
  #   else
  #     render "new", status: :unprocessable_entity
  #   end
  # end

  # # DELETE /categories/:id/remove_comment
  # def remove_comment
  #   @category = Category.find(params[:id])
  #   @comment = Comment.find(params[:id])
  #   @category.comments.delete(@comment)

  #   redirect_to categories_path, status: :see_other
  # end

  # DELETE /categories/:id
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, status: :see_other
  end
end
