class CommentsController < ApplicationController
  def index
    @show_comments = Comment.all

  end

  def show
    puts "\n\n\n\n\n\n\n\nhello world"
  end

  def create
  	p = Product.find(params[:product_id])
  	p.comments.create(comment: params[:comment][:comment])
  	redirect_to product_path(p)
  	# render :text=>params

  end

  def new

  end
end
