class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :picture, :tag_list))
		@post.save
		redirect_to '/posts'
	end

end
