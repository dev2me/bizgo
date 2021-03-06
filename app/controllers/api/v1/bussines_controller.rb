class Api::V1::BussinesController < ApplicationController
  before_action :authenticate, only: [:create,:update,:destroy]
  before_action :set_bussine, only: [:show,:update, :destroy]
  # GET /bussines
  # GET /bussines.json
  def index
    if params[:lat] && params[:long]
      @bussines = Bussine.near([params[:lat],params[:long]], 1*0.62).all
    else
      @bussines = Bussine.all
    end

    
  end

  def show
    #@user_bussine = @bussine.user
  end


  def create
    #render '/api/v1/bussines/show'
    if params[:bussine]
      @bussine = @current_user.bussines.new(bussine_params)
      if @bussine.save
        render "api/v1/bussines/show"
      else
        array_error!(@bussine.errors.full_messages, 422)
      end
    else
      error!("Los paramatros del modelo (bussine[]) no se han encontrado en la petición.",401)
    end
  end


  def update
    if @bussine.user == @current_user
      @bussine.update(bussine_params)
      render "api/v1/bussines/show"
    else
      #render json: {errors: "El usuarios no tiene autorizado realizar dicha acción."}, status: 401
      error!("El usuarios no tiene autorizado realizar dicha acción.",401)
    end
   
   
  end
  def destroy
    if @bussine.user == @current_user || @current_user.admin_bizgo?
      @bussine.delete
      render "api/v1/bussines/index"
    else
      error!("No puedes eliminar este registro. Contacta al administrador.", 401)
    end

  end
  
  private
    
    def set_bussine
      @bussine = Bussine.find(params[:id])
    end
  
    def bussine_params
      params.require(:bussine).permit(:name, :description, :lunes, :open_lunes_morning, :close_lunes_morning, :open_lunes_afternon, :close_lunes_afternon, :martes, :open_martes_morning, :close_martes_morning, :open_martes_afternon, :close_martes_afternon, :miercoles, :open_miercoles_morning, :close_miercoles_morning, :open_miercoles_afternon, :close_miercoles_afternon, :jueves, :open_jueves_morning, :close_jueves_morning, :open_jueves_afternon, :close_jueves_afternon, :viernes, :open_viernes_morning, :close_viernes_morning, :open_viernes_afternon, :close_viernes_afternon, :sabado, :open_sabado_morning, :close_sabado_morning, :open_sabado_afternon, :close_sabado_afternon, :domingo, :open_domingo_morning, :close_domingo_morning, :open_domingo_afternon, :close_domingo_afternon, :user_id, :direccion, :longitud, :latitud, :telefono, :telefono_sec, :website, :twitter, :facebook, :email, :expires_at)
    end
end
