class Api::V1::UsersController < ApplicationController
  before_action :authenticate, only: [:update]
  before_action :set_user, only: [:update, :show]
   
   #POST /users
   def create
      #params = { auth {provider: provider, uid: uid, info: { .... }  } }
      
      if params[:auth]
         @user = User.from_omniauth(params[:auth])
         @token = @user.tokens.create()
         render 'api/v1/users/show'

      else
         render json: {error: "Los paramatros de autenticación no se han encontrado en la petición." }
      end
      
   end
   def show
      @token = @user.tokens.last
   end

  def update
    if @user == @current_user
      @user.update(user_params)
      @token = @user.tokens.last
      render api_v1_user(@user)
    else
      render json: {errors: "El usuario no tiene autorizado realizar dicha acción."}, status: 401
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end