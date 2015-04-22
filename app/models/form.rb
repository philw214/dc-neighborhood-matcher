class Form < ActiveRecord::Base
  belongs_to :user
  has_one :neighborhood

  def healthcare_options
    @plan_options = %w(None Employer-Paid Bronze Silver Gold Platinum Catastrophic)
    return @plan_options
  end

  def healthcare_cost(healthcare) #will change healthcare_cost
    @plans =[
    bronze = 3312,
    silver = 4035,
    employer_paid = 4565,
    platinum = 4943]

    @cost_options = @plans.shuffle 
      
    return @cost_options
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

    @dining_cost = 
      low_cost * low_meals +
      medium_cost * medium_meals + 
      high_cost * high_meals

    return @dining_cost
  end

  def transportation_cost(mass_transit_trips)
    mass_transit = 2.54 * mass_transit_trips 
    @transportation_cost = mass_transit * 52
    return @transportation_cost
  end

  def personal_savings(income, savings)
    saving = income - savings
    @personal_savings = saving
    return @personal_savings
  end

  def cabs_cost(cabs)
    cab_transit = 10 * cabs
    @cabs_cost = cab_transit
    return @cabs_cost
  end

  




end
