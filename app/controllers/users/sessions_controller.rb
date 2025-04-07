class Users::SessionsController < Devise::SessionsController
  respond_to :html, :json

  def new
    render inertia: "Auth/Login"
  end

  def create
    if params[:user].nil? && params[:email].present?
      params[:user] = {
        email: params[:email],
        password: params[:password],
        remember_me: params[:remember]
      }
    end

    begin
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)

      if request.format.json?
        render json: { 
          status: :ok, 
          message: "Signed in successfully",
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }
      else
        redirect_to root_path, inertia: { message: "Signed in successfully" }
      end
    rescue
      render inertia: "Auth/Login", 
             props: { 
               errors: { 
                 login: ["Invalid email or password"]
               }
             },
             status: :unauthorized
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out

    if request.format.json?
      render json: { status: :ok, message: "Signed out successfully" }
    else
      redirect_to root_path
    end
  end

  private

  def respond_to_on_destroy
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigatiional_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end

  # Add this to configure what parameters are allowed
  def sign_in_params
    params.require(:user).permit(:email, :password, :remember_me)
  end

  # Add this to handle failed authentication
  def failure
    render inertia: "Auth/Login", 
           props: { 
             errors: { 
               login: [t('devise.failure.invalid', authentication_keys: User.authentication_keys.first)]
             }
           },
           status: :unauthorized
  end
end
