class WelcomeController < ApplicationController

  def index
    @profile = Profile.all.sample 
  end

end
