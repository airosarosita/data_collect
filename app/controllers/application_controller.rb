

class ApplicationController < ActionController::Base
  # Override Devise's after sign in path
  def after_sign_in_path_for(resource)
    if resource.admin? # Pastikan ada metode atau kolom di model User untuk memeriksa apakah user adalah admin
      admin_dashboards_path # Path untuk admin setelah login
    else
      client_dashboards_path # Path untuk client setelah login
    end
  end
end
