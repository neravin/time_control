class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.pluck(:name)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html {redirect_to categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  	# Use callbacks to share common setup or constraints between actions.
  	def set_category
  		@category = Category.find(params[:id])
  	end

  	# white list
  	def category_params
  		params.require(:category).permit(:id, :name)
  	end
end
