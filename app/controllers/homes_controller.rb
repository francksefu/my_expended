class HomesController < ApplicationController
  layout "home"
  def index; end

  def require_loggin
    if current_user
      redirect_to root_path
    end
  end
end
