class UsersController < ApplicationController

  def show
    sign_out :user
    redirect_to root_path
  end

end
