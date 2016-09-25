class Api::V1::PlansController < ApplicationController
  before_action :set_plan, only: [:update, :destroy]
  before_action :authenticate, only: [:create,:update,:destroy]
  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # POST /plans
  # POST /plans.json
  def create
    if @current_user.admin_bizgo?
      @plan = Plan.new(plan_params)
      if @plan.save
        render "api/v1/plans/show"
      else
        array_error!(@plan.errors.full_messages, 422)
      end
    else
      error!("Sólo administradores pueden crear nuevos planes.",401)
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    if @current_user.admin_bizgo?
      if @plan.update(plan_params)
        render "api/v1/plans/show"
      else
        array_error!(@plan.errors.full_messages, 422)
      end
    else
      error!("Sólo administradores pueden actualizar los planes.",401)
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    if @current_user.admin_bizgo?
      @plan.destroy

      render "api/v1/plans/index"
    else
      error!("Sólo administradores pueden eliminar planes.",401)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.fetch(:plan, {}).permit(:name, :description, :num_dias_expires, :price)
    end
end
