class StatesController < ApplicationController
	def index
   @states = CS.states(params[:country])
   
		# debugger
	end
end
