class ApplicationController < ActionController::Base

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
