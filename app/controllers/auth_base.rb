class AuthBase<ApplicationController

    before_action :user_auth

    private 

    def user_auth
        if current_user.nil?
            redirect_to user_session_path
        end
    end

end
