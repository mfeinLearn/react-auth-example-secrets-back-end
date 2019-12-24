class SessionsController < ApplicationController
# not necessary Sessions could call this AuthController
#.. Sessions is kind of miss leading...!
  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      # if success!!!
      # generate a JWT
      # "beans" should be EVN['SECRET']
      token = generate_token({id: @user.id})
      # include that token in the response back to the client
      # include the user in the response as well

      resp = {
        user: user_serializer(@user),
        jwt: token
      }
      render json: resp
    else
      resp = {
        error: "Invalid credentials",
        details: @user.errors.full_messages
      }
      render json: resp, status: :unauthorized
    end
  end

  def get_current_user
    if logged_in?
      render json: {
          user: user_serializer(current_user)
        }, status: :ok
    else
      render json: {error: "No current user"}
    end
  end
end
# if @user && @user.authenticate(params[:user][:password])
#   # if success!!!
#   # render json: {user: @user, secrets: @user.secrets}
#
#   # hardcoded serealizer - hardcoding of a repersentation of the bits of that user I actually want to send to the front end
#   # render json: {
#   #   name: @user.name,
#   #   email: @user.email,
#   #   id: @user.id
#   # }
#
#   # it should now look for that serealizer - instead of returning the entire user it will just be returning those bits that I included in the seralizer
#   render json: @user
# else
