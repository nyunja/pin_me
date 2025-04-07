class Users::SessionsController < Devise::SessionsController
  def new
    render inertia: "Auth/Login"
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    redirect_to root_path
  end
end
