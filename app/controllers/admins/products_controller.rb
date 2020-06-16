class Admins::ProductsController < ApplicationController

	def index
		@products = Product.order(created_at: :asc).page(params[:page])
	end

	def new
        @product = Product.new
        @active_category = Category.where(is_active: true)
    end

	def show
        @product = Product.find(params[:id])
	end

	def create
        @product = Product.new(product_params)
        if @product.save
            flash[:notice] = "商品を登録しました。"
            redirect_to(admins_product_path(@product))
        else
            @product = Product.new
            @active_category = Category.where(is_active: true)
            render(:new)
        end
	end

	def edit
	end

	def update
	end

end

private
    def product_params
        params.require(:product).permit(:name, :content, :category_id, :price, :is_active, :product_image)
    end
