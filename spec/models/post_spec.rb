require 'rails_helper'

RSpec.describe Post, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

describe '#tag_list' do 

	let(:post) { Post.create(title: 'Post One') }

	context 'when no tags are provided' do 

		it 'gives 0 tages to the post' do
			post.tag_list = ''
			expect(post.tags).to be_empty 
		end

	end

	context 'when 1 tag is added to a post' do 

		it 'adds that tag to our post' do 
			post.tag_list = 'gobanana'
			expect(post.tags.first.text).to eq('gobanana')
		end

	end

	context 'when several tags are provided by the user' do 

		it 'adds all the tags to the post' do 
			post.tag_list = 'gobanana, libtech'
			expect(post.tags.count).to eq(2)
		end

		it 'disregards duplicated tags' do 
			post.tag_list = 'gobanana, gobanana'
			expect(post.tags.count).to eq(1)
		end

	end

end


end
