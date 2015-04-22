class FormsController < ApplicationController

  before_action :find_form, only: [:show, :edit, :update]
  helper_method :current_or_guest_user
  before_action :current_or_guest_user

  def show
  # Calculate costs and display outputs 
    @tax_income = @form.tax_income(@form['income'])
    @bedrooms = @form['bedrooms']
    @neighborhood = @form.neighborhood(@form)
    @housing_cost = @form.neighborhood_cost(@neighborhood, @bedrooms)
    # @form.neighborhood_cost
    @healthcare_cost = @form.healthcare_cost(@plan)
    @personal_savings =  @form['savings']
    # @dining_cost = @form.dining_cost(@form.dining_out_low, @form.dining_out_medium, @form.dining_out_high)
    @dining_cost = @form.dining_cost(@form["dining_out_low"], @form["dining_out_medium"], @form["dining_out_high"]) 
    @grocery_cost = @form.grocery_cost(@form["dining_out_low"], @form["dining_out_medium"], @form["dining_out_high"]) 
    # @form.cabs_cost
    @cabs_cost = @form.cabs_cost(@form['cabs'])
    @transportation_cost = @form.transportation_cost(@form['mass_transit_trips'])
    # @form.driving_cost
    # @form.travel_cost
    # @form.gym_cost #golds-gym prices: 499.99
    # @form.recreation_cost #gym, travel, concerts, movies
    # @form.shopping_cost
    # @form.total_cost
    @total_cost = @housing_cost + @dining_cost + @grocery_cost + @transportation_cost + @cabs_cost # - @savings
    @user = current_or_guest_user
  end

  def new
    @form = current_or_guest_user.forms.new 
    @neighborhoods = Neighborhood.where(state: "DC").order(:name)
    @health_options = @form.healthcare_options
    @bedroom_options = @form.bedroom_options
  end

  def create
    @user = current_or_guest_user
    @form = @user.forms.new(forms_params) # Maybe make form id some SHA?
    if @form.save
      @form.update(neighborhood_id: params[:neighborhood], groceries: @groceries)
      # @user.update(form_id: @form.id)
      @user.update(form_id: params[:id])
      redirect_to @form
    else
      render :new
    end
  end

  def edit
    @neighborhoods = Neighborhood.where(state: "DC").order(:name)
    @neighborhood = Neighborhood.find(@form.neighborhood_id)
    @health_options = @form.healthcare_options
    @bedroom_options = @form.bedroom_options
  end

  def update
    if @form.update(forms_params)
      @form.update(neighborhood_id: params[:neighborhood], groceries: @groceries)
      # @user.update(form_id: params[:id])
      redirect_to @form
    else
      render :edit
    end
  end

  private

    def forms_params
      params.require(:form).permit(
        :income, 
        :neighborhood,
        :healthcare,
        :bedrooms, 
        :savings,
        :dining_out_low,
        :dining_out_medium,
        :dining_out_high,
        :driving_trips,
        :car_trip_duration,
        :mass_transit_trips,
        :groceries,
        :cabs,
        :recreation,
        :shopping#,
        # :random_path
      )
    end

    def find_form
      # @form = Form.find_by_slug!(params[:id])
      @form = Form.find(params[:id])
    end

end
