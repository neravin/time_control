class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.pluck(:name)
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
