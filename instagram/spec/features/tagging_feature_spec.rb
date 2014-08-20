require 'rails_helper'

describe 'tagging posts' do 

	it 'tags are displayed under posts' do

			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'A post with tags'
			fill_in 'Tags', with: 'gobanana, skateordie'
			click_button 'Create post'

			expect(page).to have_link('gobanana')
			expect(page).to have_link('skateordie')
	end

	context 'valid tags' do 

  		# it 'are no longer than 20 characters' do 
  		# 	visit '/posts'
  		# 	click_link 'New post'
  		# 	fill_in 'Title', with: 'A new post'	
  		# 	fill_in 'Tags', with: 'thisislongerthan20characters'
  		# 	click_button 'Create post'
  		# 	expect(page).to have_content('Text is too long (maximum is 20 characters)')
  		# end

  	end

  	context 'allows them to be sorted' do

	  	before do 
	  		add_post('Post one', 'gobanana')
	  		add_post('Post two', 'boom')
	  	end 

  		it 'when the user clicks on a tag' do 
  			visit '/posts'
  			click_link 'gobanana'
  			expect(page).to have_link('gobanana')
  			expect(page).not_to have_content('boom')
  		end
  	end

end