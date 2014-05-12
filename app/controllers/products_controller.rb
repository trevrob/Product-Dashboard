class ProductsController < ApplicationController
  def index
    @products = Product.all

  end

  def show
    @show_product = Product.find(params[:id])
    @comments = @show_product.comments
    @comment = Comment.new
    @show_comments = Comment.all
  end

  def new
    @product = Product.new
  end

  def edit
    @edit_product = Product.find(params[:id])
  end

  def create
    u = Product.new(name: params[:product][:name], description: params[:product][:description], pricing: params[:product][:pricing], category_id: params[:product][:category_id])

    if u.save 
      flash[:success] = "Successfully added a new Product!"
      redirect_to "/products"
   
    else  
      flash[:errors] = u.errors.full_messages 
      redirect_to "/products/new"
      puts u.errors.inspect
    end
  end

  def update
    product = params
    u = Product.find(params[:id])
    u.update(name: params[:product][:name], description: params[:product][:description], pricing: params[:product][:pricing], category_id: params[:product][:category_id])  

    if u.save 
      flash[:success] = "Successfully updated product! Congrats!"
      redirect_to "/products"
    else
      flash[:errors] = u.errors.full_messages
      redirect_to :back
    end 
  end

  def destroy
    puts "\n\n\n\n\n\n GOT Here!!!!!!!!"
    d = Product.find(params[:id])
    d.destroy
    redirect_to :back     

  end
end
