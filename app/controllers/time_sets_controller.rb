class TimeSetsController < ApplicationController
	before_action :set_time, only: [:show, :edit, :update, :destroy]

  def index
    @time_set = TimeSet.new
  end

  def new
  	@time_set = TimeSet.new
  end

  def create
  	@time_set = TimeSet.new(time_set_params)
  	respond_to do |format|
  		if @time_set.save
  			format.js { render :nothing => true }
  			format.json { render :json => @time_set, status: :created, location: @time_set }
  		else
  			format.json { render :json => { :error => @time_set.errors.message }, :status => 500 }
  		end
  	end
  end

  private
  	def set_time
  		@time_set = TimeSet.find(params[:id])
  	end

  	#while list
  	def time_set_params
  		params.require(:time_set).permit(
  			:id,
  			:time_end,
    		:local_result,
    		:affair_id)
  	end
end
