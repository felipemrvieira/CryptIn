class Api::V1::Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
    def render_create_success
      render json: @resource
    end
  
    def render_update_success
      render json: @resource
    end
  
    private
  
    def sign_up_params
      params.permit(:name, :email, :password, :status, :password_confirmation, :avatar)
    end
  
  end