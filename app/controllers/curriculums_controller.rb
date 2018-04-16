class CurriculumsController < ApplicationController
	def index
		@weeks = Week.all
	end
end
