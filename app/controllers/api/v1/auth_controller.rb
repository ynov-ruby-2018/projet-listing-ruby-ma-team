# app/controllers/api/v1/auth_controller.rb

# class Api::V1::AuthController < Api::V1::ApiController
#
#   def create
#     user = User.find_by(email: params[:email])
#     token = nil
#
#     if user
#       if user.valid_password?(params[:password])
#         token = user.generate_token
#       end
#     end
#
#     if token
#       render json: {success: true, token: token}
#     else
#       render json: {success: false, errors: [{ user: "Mot de passe invalide" }]}, status: 401
#     end
#   end
# end