class Tag < ActiveRecord::Base

	has_and_belongs_to_many :posts

	# validates :text, length: { in: 3..20 }

	def to_param
		text
	end

end
