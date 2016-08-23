class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    # GET /profiles
    # GET /profiles.json
    def index
        @profiles = User.all
    end

    # GET /profiles/1
    # GET /profiles/1.json
    def show
        @projects = @profile.projects
        @publications = @profile.publications
    end

    # GET /profiles/new
    def new
        @profile = Profile.new
    end

    # GET /profiles/1/edit
    def edit
    end

    # GET /myProfile
    def my_profile
        @profile = current_user
        @projects = @profile.projects
        @publications = @profile.publications
        roles = @profile.roles.order(priority: :asc)
        @role = nil
        if(roles.count > 0 )
            @role = roles.first
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
        @profile = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
        params.fetch(:profile, {})
    end
end
