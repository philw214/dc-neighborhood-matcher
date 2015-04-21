class FormsController < ApplicationController

  before_action :find_form, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @form = Form.new
    # Menu options
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


    # Calculate costs
    # @form.neighborhood_cost
    # @form.healthcare_cost
    # @form.savings_cost
    # @form.eating_out_cost
    # @form.cabs_cost
    # @form.public_transportation_cost
    # @form.driving_cost
    # @form.travel_cost
    # @form.gym_cost
    # @form.recreation_cost
    # @form.shopping_cost
  end

  def create
    @form = Form.create(forms_params)
    if @form.save
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
        :neighborhood,
        :healthcare,
        :savings,
        :eating_out,
        :groceries,
        :cabs,
        :public_transportation,
        :driving,
        :travel,
        :gym,
        :recreation,
        :shopping
      )
    end

    def find_form
      @form = Form.find(params[:id])
    end

end
