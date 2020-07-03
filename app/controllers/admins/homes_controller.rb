class Admins::HomesController < ApplicationController

	def top
        # 当日の注文件数を取得する
        orders = Order.where(created_at: Time.current.beginning_of_day..Time.current.end_of_day)
        @count = orders.count
	end

end
