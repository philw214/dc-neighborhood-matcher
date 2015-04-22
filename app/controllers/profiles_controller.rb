class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @next_profile = Profile.all.sample 
  end

end
