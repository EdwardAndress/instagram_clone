class Post < ActiveRecord::Base

	has_and_belongs_to_many :tags

	has_attached_file :picture,
	styles: { medium: "400x400#"},
	:storage => :s3,
  	:s3_credentials => {
    	:bucket => 'andress_instagram',
    	:access_key_id => Rails.application.secrets.s3_access_key_id,
	    :secret_access_key => Rails.application.secrets.s3_secret_access_key_id
	}
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/



	def tag_list
	end

	def tag_list=(tags)
		return if tags.empty?

		tags.split(', ').uniq.each do |tag|
			self.tags << Tag.find_or_create_by(text: tag)
		end
	end

end