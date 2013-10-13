module TopRated
	def top(n)
		raise "Illegal" unless self.respond_to?(:all)
	
		all.sort_by{ |model| -model.average_rating }.first(n)
	end
end
