class Post < ActiveRecord::Base

	has_attached_file :picture,
	styles: { medium: "300x300#"},
	:storage => :s3,
  	:s3_credentials => {
    	:bucket => 'andress_instagram',
    	:access_key_id => Rails.application.secrets.s3_access_key_id,
	    :secret_access_key => Rails.application.secrets.s3_secret_access_key_id
	}
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end