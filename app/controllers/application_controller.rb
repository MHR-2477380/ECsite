class ApplicationController < ActionController::Base

    # 消費税に関するグローバル変数
    $delivery_fee = 800
    $tax_rate = 0.1

    # ログイン後の遷移先
    def after_sign_in_path_for(resource)
        case resource
        # 管理者
        when Admin
			admins_path
        # 顧客
        when Customer
            root_path
        end
    end

end
