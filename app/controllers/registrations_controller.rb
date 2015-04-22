class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(user) 
    # Assign guest form to newly created user
    @form = Form.find_by(user_id: guest_user.id)
    @user.update(form_id: @form.id)
    return @form
  end

  def after_sign_in_path_for(user)
    @form = Form.find_by(user_id: user.id)
    redirect_to @form
  end

  private

end