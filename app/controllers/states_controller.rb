class StatesController < ApplicationController
	# app/controllers/states_controller.rb
def index
   @states = CS.states(params[:country])
end

end
