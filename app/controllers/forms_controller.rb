class FormsController < ApplicationController

  before_action :find_form, only: [:show, :edit, :update, :destroy]
  helper_method :current_or_guest_user
  before_action :current_or_guest_user

  def show
  # Calculate costs and display outputs 
    # @form.tax_adjusted_income 
    # @form.neighborhood_cost
    # @form.healthcare_cost
    # @form.savings_cost
    # @dining_cost = @form.dining_cost(@form.dining_out_low, @form.dining_out_medium, @form.dining_out_high)
    @dining_cost = @form["dining_out_low"]
    # @form.cabs_cost
    # @form.public_transportation_cost
    # @form.driving_cost
    # @form.travel_cost
    # @form.gym_cost
    # @form.recreation_cost
    # @form.shopping_cost
    # @form.total_cost
  end

  def new
    @form = current_or_guest_user.forms.new 
    @neighborhoods = Neighborhood.where(state: "DC").order(:name)
    @health_options = @form.healthcare_options
    # @form.savings_options
    # @form.eating_out_options
    # @form.cabs_options
    # @form.public_transportation_options
    # @form.driving_options
    # @form.travel_options
    # @form.gym_options
    # @form.recreation_options
    # @form.shopping_options

  end

  def create
    @form = current_or_guest_user.forms.new(forms_params)
    if @form.save
      @form.update(neighborhood_id: params[:neighborhood])
      redirect_to @form
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @form.update(forms_params)
      redirect_to @form
    else
      render :edit
    end
  end

  def destroy # If the user chooses not to save her form
  end

  private

    def forms_params
      params.require(:form).permit(
        :income, 
        :neighborhood,
        :healthcare,
        :savings
        # :dining_out_low,
        # :dining_out_medium,
        # :dining_out_high,
        # :driving_trips,
        # :car_trip_duration,
        # :mass_transit_trips,
        # :groceries,
        # :cabs,
        # :public_transportation,
        # :recreation,
        # :shopping
      )
    end

    def find_form
      @form = Form.find(params[:id])
    end

end
