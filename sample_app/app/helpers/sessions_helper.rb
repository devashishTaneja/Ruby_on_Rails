module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def logged_in?
        !current_user.nil?
    end

    def current_user
        # @current_user ||= User.find_by(id: session[:user_id])
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticate(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def log_out
        cookies.delete(:user_id)
        cookies.delete(:remember_digest)
        session.delete(:user_id)
        # forget(@current_user)
        @current_user = nil
    end
end
