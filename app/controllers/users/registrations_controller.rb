class Users::RegistrationsController < Devise::RegistrationsController
  def new
    render inertia: "Auth/Register"
  end

  def create
    if resource.save
      sign_in(resource_name, resource)
      redirect_to root_path
    else
      render inertia: "Auth/Register", props: {
        errors: resource.errors.messages
      }, status: :unprocessable_entity
    end
  end
end
