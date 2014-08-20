class PostsController < ApplicationController

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

	def show
		@posts = Post.find_by(params[:id])
	end

end
