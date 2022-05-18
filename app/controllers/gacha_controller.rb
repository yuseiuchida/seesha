class GachaController < ApplicationController
	def new
    kind = [2, 3 ,4].sample
		ids = Flavor.ids.shuffle.take(kind).sort
    @flavor1 = Flavor.find(ids[0])
    @flavor2 = Flavor.find(ids[1])
    @flavor3 = Flavor.find(ids[2]) if ids.length > 2
    @flavor4 = Flavor.find(ids[3]) if ids.length > 3
		if ids.length == 2
			name = @flavor1.name + " " + @flavor2.name
		elsif ids.length == 3
			name = @flavor1.name + " " + @flavor2.name + " " + @flavor3.name
		else
			name = @flavor1.name + " " + @flavor2.name + " " + @flavor3.name + " " + @flavor4.name
		end
		@combination = Combination.find_by(name: name)
	end

	def create
	end
end
