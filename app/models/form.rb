class Form < ActiveRecord::Base
  belongs_to :user
  has_one :neighborhood

  def healthcare_options
    @plan_options = %w(None Employer-Paid Bronze Silver Gold Platinum Catastrophic)
    return @plan_options
  end

end
