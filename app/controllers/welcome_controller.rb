class WelcomeController < ApplicationController

  def index
    @profile = Profile.all.sample 
    @profiles = Profile.all.sample(5)
  end

end
