class CategoriesController < ApplicationController

  # if user is not authenticated, don't let them do anything 
  before_action :authenticate_user!
  # make sure it's the correct user for pages that have edit, update, destroy methods
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @tasks = Task.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    # @category = Category.new
    @category = current_user.categories.build
  end

  def create
    # @category = Category.new(category_params)
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  def correct_user
    # @user = User.all
    @category = current_user.categories.find_by(id: params[:id]) # find id by primary key
    # if not the correct user
    redirect_to categories_path, notice: "You are not authorized to edit this category." if @category.nil?
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :category_body, :user_id)
  end
end
