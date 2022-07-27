class ProductsController < ApplicationController




  def index
    @product = Product.all()
  end




  def about

  end



  def new
    @product = Product.new()
  end




  def show
    @product = Product.find(params[:id])
  end



  def edit
    @product = Product.find(params[:id])
  end




  def update
    @product = Product.find(params[:id])
    if (@product.update(product_params))
      redirect_to @product
    else
      render 'edit'
    end
  end



  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    if (@product.destroy)
      redirect_to home_path
    end
  end





  def create
    @product = Product.new(product_params)
    @product.save
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end




  private def product_params
    params.require(:product).permit(:title, :body, :image, :useremail, :userid, :mobile)
  end
end
