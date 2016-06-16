class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  def render404
    render :file => File.join(Rails.root, 'public', '404.html'), :status => 404, :layout => false
    return true
  end

  def citizen_only
    unless current_user.citizen?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def alderman_only
    unless current_user.alderman?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def assembly_president_only
    unless current_user.assembly_president?
      redirect_to :back, :alert => "Access denied."
    end
  end

end
