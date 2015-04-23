class Form < ActiveRecord::Base
  belongs_to :user
  has_one :neighborhood

  validate :only_three_meals_a_day

  validates :income, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 500_000
  }

  validates :savings, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 500_000
  }

  validates :recreation, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 500_000
  }

  validates :shopping, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 500_000
  }   

  attr_accessor :neighborhood

  def only_three_meals_a_day
    if self["dining_out_low"] + self["dining_out_medium"] + self["dining_out_high"] > 21
      errors.add(:dining_out_low, "Please specify at most 21 meals for dining out.")
    end 
  end

  def neighborhood(form)
    @neighborhood = Neighborhood.find(form.neighborhood_id)
    return @neighborhood
  end

  def neighborhood_cost(neighborhood, bedrooms)
    if bedrooms == "Studio"
      @neighborhood_cost = neighborhood['studio_price'] * 12
    elsif bedrooms == "One"
      @neighborhood_cost = neighborhood['one_bed_price'] * 12
    else
      @neighborhood_cost = neighborhood['two_bed_price'] * 12
    end
    return @neighborhood_cost
  end

  def bedroom_options
    @room_options = %w(Studio One Two)
    return @room_options
  end

  def healthcare_options
    @plan_options = %w(None Employer-Paid Bronze Silver Gold Platinum Catastrophic)
    return @plan_options
  end

  def healthcare_cost(plan)
  none = 0
  employer_paid = 4564
  bronze = 3312
  silver = 4035
  gold = 4500
  platinum = 4943
  catastrophic = 6350

    if plan == 'None'
      @healthcare_cost = none
    elsif plan == 'Employer-Paid'
      @healthcare_cost = employer_paid
    elsif plan == 'Bronze'
      @healthcare_cost = bronze
    elsif plan == 'Silver' 
      @healthcare_cost = silver
    elsif plan == 'Gold'
      @healthcare_cost = gold
    elsif plan =='Platinum'
      @healthcare_cost = platinum
    else 
      @healthcare_cost = catastrophic
    end
    return @healthcare_cost
  end
        


  def tax_income (income)
    adjusted_income = income - (income *0.0895) #dc income tax is 8.95%
    @tax_income = adjusted_income
    return @tax_income
  end

  def dining_cost(low_meals, medium_meals, high_meals)
    low_cost = 10
    medium_cost = 15
    high_cost = 30

    @dining_cost = 52 *
      low_cost * low_meals +
      medium_cost * medium_meals + 
      high_cost * high_meals

    return @dining_cost
  end


  def grocery_cost(low_meals, medium_meals, high_meals)
    meals_out = low_meals + medium_meals + high_meals
    meals_at_home = 21 - meals_out
    cooking_cost = 5
    @grocery_cost = meals_at_home * cooking_cost * 52
  end

  def driving_cost(driving_trips, car_trip_duration)
    gas = 2.50
    driving = driving_trips * car_trip_duration * 2.50 * 52
    @driving_cost = driving
    return @driving_cost
  end # this method is not complete yet


  def transportation_cost(mass_transit_trips)
    mass_transit = 2.54 * mass_transit_trips 
    @transportation_cost = mass_transit * 52
    return @transportation_cost
  end

  def cabs_cost(cabs)
    cab_transit = 10 * cabs
    @cabs_cost = cab_transit 
    return @cabs_cost
  end

  # def recreation_cost
  #   gym = 499.99
  #   movies = 15 
  #   concert= 35
  #   spa = 85
  # end
  

end
