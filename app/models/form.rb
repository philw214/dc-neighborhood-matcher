class Form < ActiveRecord::Base
  belongs_to :user
  has_one :neighborhood

  def healthcare_options
    @plan_options = %w(None Employer-Paid Bronze Silver Gold Platinum Catastrophic)
    return @plan_options
  end

  def dining_cost(low_meals, medium_meals, high_meals)
    low_cost = 10
    medium_cost = 15
    high_cost = 30

    @dining_cost = 
      low_cost * low_meals +
      medium_cost * medium_meals + 
      high_cost * high_meals

    return @dining_cost
  end

end
