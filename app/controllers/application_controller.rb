# Devise method for creating guest users
class ApplicationController < ActionController::Base

  protect_from_forgery

  def after_sign_in_path_for(user)
    @form = Form.find_by(user_id: user)
    return @form
  end

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        guest_user(with_retry = false).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user if with_retry
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
  def logging_in
    guest_form = Form.find_by(user_id: guest_user.id)
    guest_form.user_id = current_user.id
    guest_form.save!
  end
    

  def create_guest_user
    user = User.create(:email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    user.save!(:validate => false)
    session[:guest_user_id] = user.id
    return user
  end

helper_method :current_or_guest_user

end