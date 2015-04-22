class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(user) #check
    # current_or_guest_user
    binding.pry
    @form = Form.find_by(user_id: guest_user.id)
    @user.update(form_id: @form.id)
    # user.update(form_id: @form.id)
    return @form
  end

  def after_sign_in_path_for(user)
    binding.pry
    @form = Form.find_by(user_id: user.id)
    redirect_to @form
  end

  private

  # def after_sign_out_path_for(user)
  #   sign_out :user
  #   root_path
  # end

end