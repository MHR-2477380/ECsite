class Admins::CustomersController < ApplicationController

	def index
        @customers = Customer.all
	end

	def show
        @customer =  Customer.find(params[:id])
	end

	def edit
		@customer =  Customer.find(params[:id])
	end

	def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            flash[:notice] = "顧客情報を編集しました。"
            redirect_to(admins_customer_path(@customer))
        else
            @customer =  Customer.find(params[:id])
            render(:edit)
        end
    end

end

private
    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email, :is_active)
    end