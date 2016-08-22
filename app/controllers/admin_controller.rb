class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin_user
    before_action :set_member, only: [:edit_member, :update_member]


    def members
        @users = User.all
    end

    def edit_member

    end

    def update_member

    end
    private

    def check_admin_user
        if not is_admin
            flash[:notice] = "You don't access to this page!!"
            redirect_to root_path
        end
    end

    def set_member
        @user = User.find_by_id(params[:id])
        if @user.nil?
            redirect_to action: 'members'
        end
    end
end
