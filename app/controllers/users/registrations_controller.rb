class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html

  def new
    render inertia: "Auth/Register"
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        redirect_to "/", inertia: { message: "Signed up successfully" }
      else
        expire_data_after_sign_in!
        redirect_to "/", inertia: { message: "Signed up successfully but not activated yet" }
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render inertia: "Auth/Register",
             props: { errors: resource.errors.messages },
             status: :unprocessable_entity
    end
  end

  protected

  def sign_up_params
    params.permit(:email, :password, :password_confirmation)
  end
end
