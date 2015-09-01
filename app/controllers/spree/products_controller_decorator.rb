Spree::ProductsController.class_eval do
  before_action :get_product_id, only: [:edit, :update_product_user, :new_image, :destroy_product_user]
  before_action :auth_product_user, only: [:edit, :update_product_user, :new_image, :destroy_product_user]
  before_action :aut_user, only: [:all_product_user, :new, :destroy_image_product]

  def all_product_user
    @products = spree_current_user.spree_products
  end

  def new
  end

  def create
  	@product = spree_current_user.spree_products.new(get_params_product_user)
  	#@product = spree_current_user.spree_products.create(get_params_product_user)
    #@variant = @product.variants
  	if @product.save
  		redirect_to all_product_user_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update_product_user
    if @product.update(get_params_product_user)
      redirect_to all_product_user_path
    else
      render 'edit'
    end
  end

  def new_image
    @images = @product.images
    @variant_id = @product.variants_including_master_ids
  end

  def create_image_product_user
    @image = Spree::Image.create(get_params_image_product)
    
    @image.save
    redirect_to all_product_user_path
  end

  def destroy_product_user
    @product.destroy
    redirect_to all_product_user_path
  end

  def destroy_image_product
    @image = Spree::Image.find(params[:id])
    
    @image.destroy
    redirect_to all_product_user_path
  end

  private

  def get_product_id
    @product = Spree::Product.friendly.find(params[:id])
  end

  def get_params_product_user
  	params.require(:product).permit(:name, :description, :price, :shipping_category_id, :tax_category_id)
  end

  def get_params_image_product
    params.require(:image).permit(:attachment, :viewable_type, :viewable_id) if params[:image]
  end

  def aut_user
    unless spree_current_user
      redirect_to products_path
    end
  end

  def auth_product_user
    product = Spree::Product.friendly.find(params[:id])
    unless ((spree_current_user.try(:id) == product.user_id) || spree_current_user.try(:admin?) )
       redirect_to products_path
     end
  end
end
