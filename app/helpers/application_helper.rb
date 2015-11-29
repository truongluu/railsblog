module ApplicationHelper
	def gravatar_for( chef, options = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest( chef.email.downcase )
		size = options[ :size ]
		puts "size #{size}"
	end
end
