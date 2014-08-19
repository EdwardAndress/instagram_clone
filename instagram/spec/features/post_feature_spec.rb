require 'rails_helper'

describe 'posts' do 

	context 'no posts' do

		it 'shows a message to indicate a lack of posts' do
			visit '/posts'
			expect(page).to have_content('No posts yet')
		end

	end

	context 'with posts' do

		before(:each) {Post.create(title: 'This is the first post')}

		it 'displays a list of posts' do
			visit '/posts'
			expect(page).to have_content('This is the first post')
		end

	end

	context 'creating posts' do 

		it 'adds the posts from a form' do 
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Another post'
			click_button 'Create post'
			expect(page).to have_content 'Another post'
			expect(current_path).to eq '/posts'
		end

		it 'can attach an image to a post' do 
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Another another post'
			attach_file 'Picture', Rails.root.join('spec/images/smallversion.jpg')
			click_button 'Create post'

			expect(page).to have_css('img.uploaded_image')
		end

	end

	context 'can be tagged' do 
	end

end