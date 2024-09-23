# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    forms_path # Redirige a la vista forms después de iniciar sesión
  end

  def after_sign_out_path_for(resource_or_scope)
    unauthenticated_root_path # Redirige a la raíz no autenticada después de cerrar sesión
  end
end
