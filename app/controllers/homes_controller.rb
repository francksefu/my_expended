class HomesController < ApplicationController
  layout 'home'
  def index; end

  def require_loggin
    return unless current_user

    redirect_to root_path
  end
end
