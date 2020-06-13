class Admins::ProductsController < ApplicationController

	def index
		@products = Product.order(created_at: :asc).page(params[:page])
	end

	def new
        @product = Product.new
        @active_category = Category.where(is_active: true)
    end

	def show
	end

	def create
	end

	def edit
	end

	def update
	end

end
