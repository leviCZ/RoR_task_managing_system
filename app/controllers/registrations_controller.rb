class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_no_authentication
    before_action :resource_name

    def resource_name
        :user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User successfully created!"
            sign_in(@user)
            respond_with(@user, location: root_path)
        else
            flash.now[:alert] = "Please fix the errors below."
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
