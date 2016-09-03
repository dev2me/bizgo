class Api::V1::UsersController < ApplicationController
   
   
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
       #render 'api/v1/users/show'
       @user = User.find(params[:id])
       @token = @user.tokens.last
   end
end