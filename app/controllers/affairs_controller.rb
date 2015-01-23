class AffairsController < ApplicationController
	before_action :set_affair, only: [:show, :edit, :update, :destroy]

  def index
  	@affairs = Affair.all
  end

  def new
  	@affair = Affair.new
  end

  def create
  	@affair = Affair.new(affair_params)

  	respond_to do |format|
  		if @affair.save
  			format.html {redirect_to affairs_path, notice: 'Affair was successfully created.' }
  		else
  			format.html { render action: 'new' }
  		end
  	end
  end

  private
  	def set_affair
  		@affair = Affair.find(params[:id])
  	end

  	# white list
  	def affair_params
  		params.require(:affair).permit(
  			:id, 
  			:name, 
  			:description, 
  			:result, 
  			:category_id)
  	end
end
