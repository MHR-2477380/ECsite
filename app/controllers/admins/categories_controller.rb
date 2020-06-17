class Admins::CategoriesController < ApplicationController

    def index
        @category = Category.new
        @categories = Category.all
 	end

    def create
        @category = Category.new(category_params)
        @categories = Category.all
        if @category.save
        else
            render(:index)
        end
    end

    def edit
    end

    def update
    end

end

private
    def category_params
        params.require(:category).permit(:name, :is_active)
    end
