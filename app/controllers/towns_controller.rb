class TownsController < ApplicationController
	def city
    @cities = CS.cities(params[:state], params[:country])
    
  end
end
