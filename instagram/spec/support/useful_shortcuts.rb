def add_post(title, tags)
	visit '/posts'
	click_link 'New post'
	fill_in 'Title', with: title
	fill_in 'Tags', with: tags
	click_button 'Create post'
end