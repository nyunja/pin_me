class ApplicationController < ActionController::Base
  inertia_share auth: -> {
    {
      user: current_user ? {
        id: current_user.id,
        email: current_user.email
      } : nil
    }
  }
end
