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
        add_post('Post three', 'gobanana, libtech')
	  	end 

  		it 'when the user clicks on a tag' do 
  			visit '/posts'
  			click_link 'libtech'
        expect(page).to have_css 'h1', text: 'Posts tagged with libtech'
        expect(page).to have_link('libtech')
  			expect(page).not_to have_link('boom')
  		end

      it 'are accessible via pretty URLs' do 
        visit '/tags/gobanana'
        expect(page).to have_content('gobanana')
      end

  	end

end